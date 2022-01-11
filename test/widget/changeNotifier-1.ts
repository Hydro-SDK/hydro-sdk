import { FloatingActionButton } from "./../../runtime/flutter/material/floatingActionButton";
import { Icons } from "./../../runtime/flutter/material/icons";
import { runApp } from "./../../runtime/flutter/runApp";
import { Column } from "./../../runtime/flutter/widgets/column";
import { Icon } from "./../../runtime/flutter/widgets/icon";
import { Type } from "../../runtime/dart/core/type";
import { ChangeNotifier } from "../../runtime/flutter/foundation/changeNotifier";
import { Key } from "../../runtime/flutter/foundation/key";
import { AppBar } from "../../runtime/flutter/material/appBar";
import { MaterialApp } from "../../runtime/flutter/material/materialApp";
import { Scaffold } from "../../runtime/flutter/material/scaffold";
import { Theme } from "../../runtime/flutter/material/theme";
import { Center } from "../../runtime/flutter/widgets/center";
import { MainAxisAlignment } from "../../runtime/flutter/widgets/mainAxisAlignment";
import { StatelessWidget } from "../../runtime/flutter/widgets/statelessWidget";
import { Text } from "../../runtime/flutter/widgets/text";
import { ScopedModel } from "../../runtime/scopedModel/scopedModel";
import { ScopedModelDescendant } from "../../runtime/scopedModel/scopedModelDescendant";

class CounterModel extends ChangeNotifier {
    public counter = 0;

    public static staticType = new Type(CounterModel);
    public runtimeType = CounterModel.staticType;

    public constructor() {
        super();
    }

    public increment = (): void => {
        this.counter += 1;
        this.notifyListeners();
    };
}

class MyApp extends StatelessWidget {
    public counterModel: CounterModel;

    public constructor(counterModel: CounterModel) {
        super();
        this.counterModel = counterModel;
    }

    public build() {
        return new ScopedModel({
            model: this.counterModel,
            child: new MaterialApp({
                title: "Scoped model test",
                home: new CounterHome("Scoped model test"),
            }),
        });
    }
}

class CounterHome extends StatelessWidget {
    public title: string;

    public constructor(title: string) {
        super();
        this.title = title;
    }

    public build() {
        return new Scaffold({
            appBar: new AppBar({
                title: new Text(this.title),
            }),
            body: new Center({
                child: new Column({
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                        new Text("You have pushed the button this many times"),
                        new ScopedModelDescendant<CounterModel>({
                            builder: (context, __, model) => {
                                return new Text(
                                    model?.counter.toString() ?? "",
                                    {
                                        key: new Key("counter"),
                                        style: Theme.of(context).textTheme
                                            .headline4,
                                    }
                                );
                            },
                            child: undefined,
                            type: CounterModel.staticType,
                        }),
                    ],
                }),
            }),
            floatingActionButton: new ScopedModelDescendant<CounterModel>({
                builder: (_, __, model) => {
                    return new FloatingActionButton({
                        onPressed: model ? model.increment : () => undefined,
                        key: new Key("increment"),
                        child: new Icon(Icons.add),
                    });
                },
                child: undefined,
                type: CounterModel.staticType,
            }),
        });
    }
}

runApp(() => new MyApp(new CounterModel()));
