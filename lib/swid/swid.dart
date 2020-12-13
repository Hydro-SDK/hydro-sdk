import 'dart:convert';
import 'dart:io';

import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/ast/visitor.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:hydro_sdk/swid/ir/frontend/dart/swidClass.dart';
import 'package:hydro_sdk/swid/ir/frontend/dart/swidEnum.dart';
import 'package:hydro_sdk/swid/ir/frontend/dart/swidFunctionType.dart';
import 'package:hydro_sdk/swid/ir/frontend/dart/narrowModifierProducer.dart';
import 'package:hydro_sdk/swid/ir/frontend/dart/swidDeclarationModifiers.dart';
import 'package:hydro_sdk/swid/ir/frontend/dart/swidInterface.dart';
import 'package:hydro_sdk/swid/ir/frontend/dart/swidNullabilitySuffix.dart';
import 'package:hydro_sdk/swid/ir/frontend/dart/swidStaticConstFieldDeclaration.dart';
import 'package:hydro_sdk/swid/ir/frontend/dart/swidType.dart';
import 'package:surveyor/src/driver.dart';
import 'package:surveyor/src/visitors.dart';

import 'package:analyzer/src/dart/ast/ast.dart';
import 'package:analyzer/file_system/file_system.dart' hide File;
import 'package:analyzer/source/line_info.dart';
import 'package:path/path.dart' as path;

int dirCount;

Future<SwidVisitor> swid(List<String> args) async {
  if (args.length == 1) {
    var dir = args[0];
    if (!File('$dir/pubspec.yaml').existsSync()) {
      print("Recursing into '$dir'...");
      args = Directory(dir).listSync().map((f) => f.path).toList()..sort();
      dirCount = args.length;
      print('(Found $dirCount subdirectories.)');
    }
  }

  var driver = Driver.forArgs(args);
  driver.excludedPaths = ["test"];
  driver.forceSkipInstall = true;
  driver.showErrors = false;
  driver.resolveUnits = true;
  driver.visitor = SwidVisitor();
  await driver.analyze();

  return driver.visitor;
}

class SwidVisitor extends RecursiveAstVisitor
    implements PreAnalysisCallback, PostAnalysisCallback, AstContext {
  int count = 0;
  int contexts = 0;
  String filePath;
  Folder currentFolder;
  LineInfo lineInfo;

  List<String> reports = <String>[];
  List<SwidEnum> enums = [];
  List<SwidClass> classes = [];

  @override
  void visitEnumDeclaration(EnumDeclaration node) {
    print((node.parent.root as CompilationUnit)
        .declaredElement
        .librarySource
        .uri);

    DeclaredSimpleIdentifier identifier =
        node.childEntities.firstWhere((x) => x is DeclaredSimpleIdentifier);
    if (identifier.name[0] != "_") {
      List<EnumConstantDeclarationImpl> declarations = node.childEntities
          .where((x) => x is EnumConstantDeclarationImpl)
          .toList()
          .cast<EnumConstantDeclarationImpl>();
      enums.add(SwidEnum(
          originalPackagePath: (node.parent.root as CompilationUnit)
              .declaredElement
              .librarySource
              .uri
              .toString(),
          identifier: identifier.name,
          children: declarations.map((x) => x.name.name).toList()));
    }

    super.visitEnumDeclaration(node);
  }

  @override
  void visitClassDeclaration(ClassDeclaration node) {
    if (node.withClause == null &&
        node.nativeClause == null &&
        node.name.name[0] != "_") {
      if (node.name.name == "Icons") {
        print("Icons");
      }

      final List<ConstructorDeclarationImpl> constructors = node.childEntities
          .where((x) => x is ConstructorDeclarationImpl)
          .toList()
          .cast<ConstructorDeclarationImpl>()
          .where((x) => !x.declaredElement.hasProtected)
          .toList();
      final constructorDeclarationImpl = constructors
          .firstWhere((x) => x.factoryKeyword == null, orElse: () => null);
      if (constructorDeclarationImpl != null) {
        if (constructorDeclarationImpl.declaredElement.isPublic ||
            node.childEntities.firstWhere(
                    (x) => x is FieldDeclaration && x.staticKeyword != null,
                    orElse: () => null) !=
                null) {
          var methods = node.childEntities
              .where((x) => x is MethodDeclarationImpl)
              .toList()
              .cast<MethodDeclarationImpl>()
              .where((x) => x.name.name[0] != "_")
              .toList()
              .cast<MethodDeclarationImpl>()
              .map((x) => SwidFunctionType.fromFunctionType(
                  functionType: x.declaredElement.type,
                  swidDeclarationModifiers: narrowModifierProducer(
                      element: x.declaredElement,
                      onExecutablElement: (val) =>
                          SwidDeclarationModifiers.fromExecutableElement(
                              executableElement: val),
                      onPropertyAccessorElement: (val) =>
                          SwidDeclarationModifiers.fromPropertyAccessorElement(
                              propertyAccessorElement: val))))
              .toList()
              .cast<SwidFunctionType>();
          classes.add(
            SwidClass(
                name: node.name.name,
                nullabilitySuffix: SwidNullabilitySuffix.none,
                originalPackagePath:
                    node.declaredElement?.librarySource?.uri?.toString() ?? "",
                constructorType: SwidFunctionType.fromFunctionType(
                    swidDeclarationModifiers: SwidDeclarationModifiers.empty(),
                    functionType:
                        constructorDeclarationImpl.declaredElement.type),
                factoryConstructors: constructors
                    .where((x) =>
                        x.factoryKeyword != null &&
                        x.name != null &&
                        x.name.name[0] != "_")
                    .toList()
                    .map((x) => SwidFunctionType.fromFunctionType(
                        functionType: x.declaredElement.type,
                        name: x.name.name,
                        swidDeclarationModifiers:
                            SwidDeclarationModifiers.empty()))
                    .toList(),
                methods: methods
                    .where((x) => !x.swidDeclarationModifiers.isStatic)
                    .toList(),
                staticMethods: methods
                    .where((x) => x.swidDeclarationModifiers.isStatic)
                    .toList(),
                staticConstFieldDeclarations: node.childEntities
                    .where((x) => x is FieldDeclaration)
                    .toList()
                    .cast<FieldDeclaration>()
                    .map((x) {
                  if (x.isStatic) {
                    var declarationList = (x.childEntities
                            .firstWhere((k) => k is VariableDeclarationList)
                        as VariableDeclarationList);
                    if (declarationList.isConst) {
                      VariableDeclaration declaration = declarationList
                          .childEntities
                          .firstWhere((x) => x is VariableDeclaration);
                      if (declaration.isConst &&
                          declaration.declaredElement.isConst &&
                          declaration.declaredElement.isStatic &&
                          declaration.declaredElement.isPublic) {
                        return SwidStaticConstFieldDeclaration
                            .fromVariableDeclarationList(
                                variableDeclarationList: x.childEntities
                                    .firstWhere(
                                        (k) => k is VariableDeclarationList));
                      }
                    }
                  }
                }).toList()
                      ..removeWhere((x) => x == null),
                instanceFieldDeclarations: Map.fromEntries(
                  node.childEntities
                      .where((x) => x is FieldDeclaration)
                      .toList()
                      .cast<FieldDeclaration>()
                      .map((x) {
                    if (!x.isStatic) {
                      var declarationList = (x.childEntities
                              .firstWhere((k) => k is VariableDeclarationList)
                          as VariableDeclarationList);
                      if (!declarationList.isConst) {
                        VariableDeclaration declaration = declarationList
                            .childEntities
                            .firstWhere((x) => x is VariableDeclaration);
                        if (!declaration.isConst &&
                            !declaration.declaredElement.isConst &&
                            !declaration.declaredElement.isStatic &&
                            declaration.declaredElement.isPublic) {
                          if (declaration.declaredElement.type
                              is InterfaceType) {
                            return MapEntry(
                                declaration.declaredElement.displayName,
                                SwidType.fromSwidInterface(
                                    swidInterface: SwidInterface.fromInterface(
                                        interfaceType:
                                            declaration.declaredElement.type)));
                          }
                        }
                      }
                    }
                  }).toList()
                        ..removeWhere((x) => x == null),
                )),
          );
        }
      }
    }

    if (node.name.name == "IconData") {
      print(node.name.name);
      File("test/swid/res/IconData.json")
          .writeAsStringSync(json.encode(classes.last.toJson()));
    }

    if (node.name.name == "IconDataProperty") {
      print(node.name.name);
      File("test/swid/res/IconDataProperty.json")
          .writeAsStringSync(json.encode(classes.last.toJson()));
    }

    if (node.name.name == "Icons") {
      print(node.name.name);
      File("test/swid/res/Icons.json")
          .writeAsStringSync(json.encode(classes.last.toJson()));
    }

    if (node.name.name == "CupertinoIcons") {
      print(node.name.name);
      File("test/swid/res/CupertinoIcons.json")
          .writeAsStringSync(json.encode(classes.last.toJson()));
    }

    if (node.name.name == "IconData") {
      print(node.name.name);
      File("test/swid/res/IconData.json")
          .writeAsStringSync(json.encode(classes.last.toJson()));
    }

    if (node.name.name == "DiagnosticsNode") {
      print(node.name.name);
      File("test/swid/res/DiagnosticsNode.json")
          .writeAsStringSync(json.encode(classes.last.toJson()));
    }

    super.visitClassDeclaration(node);
  }

  @override
  void visitMethodDeclaration(MethodDeclaration node) {
    if (node.externalKeyword == null &&
        !node.isAbstract &&
        !node.isOperator &&
        !node.isStatic) {
      if (node.name == "scheduleTick") {
        print(node);
      }
    }

    super.visitMethodDeclaration(node);
  }

  @override
  void postAnalysis(SurveyorContext context, DriverCommands cmd) {
    cmd.continueAnalyzing = true;
  }

  @override
  void preAnalysis(SurveyorContext context,
      {bool subDir, DriverCommands commandCallback}) {
    if (subDir) {
      ++dirCount;
    }
    var contextRoot = context.analysisContext.contextRoot;
    currentFolder = contextRoot.root;
    var dirName = path.basename(contextRoot.root.path);

    print("Analyzing '$dirName' • [${++count}/$dirCount]...");
  }

  @override
  void setFilePath(String filePath) {}

  @override
  void setLineInfo(LineInfo lineInfo) {}
}
