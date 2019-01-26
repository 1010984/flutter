import 'package:flutter/material.dart';
import './card_manager.dart';
import './bar_app.dart';

int option = 1;

main() => runApp(RestartWidget(option,
    child: MaterialApp(
        theme: ThemeData(
            primarySwatch: Colors.blue,
            brightness: Brightness.light,
            accentColor: Colors.deepOrange),
        home: MyApp())));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('AJPS pairs'),
        actions: <Widget>[
          // action button
          IconButton(
            icon: Icon(Icons.lens),
            onPressed: () {
              RestartWidget.setOption(context, 0);
            },
          ),
          // action button
          IconButton(
            icon: Icon(Icons.lens),
            onPressed: () {
              RestartWidget.setOption(context, 1);
            },
          ),
          IconButton(
            icon: Icon(Icons.lens),
            onPressed: () {
              RestartWidget.setOption(context, 2);
            },
          ),
        ],
      ),
      drawer: Bar.getBar(context),
      body: CardManager(RestartWidget.getOption(context) == null
          ? 1
          : RestartWidget.getOption(context)),
    );
  }
}

class RestartWidget extends StatefulWidget {
  final Widget child;
  final int option;
  RestartWidget(this.option, {this.child});

  static restartApp(BuildContext context) {
    final _RestartWidgetState state =
        context.ancestorStateOfType(const TypeMatcher<_RestartWidgetState>());
    state.restartApp();
  }

  static closeApp(BuildContext context) {
    Navigator.of(context).pop();
  }

  static setOption(BuildContext context, int option) {
    final _RestartWidgetState state =
        context.ancestorStateOfType(const TypeMatcher<_RestartWidgetState>());
    state.setOption(option);
  }

  static int getOption(BuildContext context) {
    final _RestartWidgetState state =
        context.ancestorStateOfType(const TypeMatcher<_RestartWidgetState>());
    return state.getOption();
  }

  @override
  _RestartWidgetState createState() => new _RestartWidgetState(option);
}

class _RestartWidgetState extends State<RestartWidget> {
  Key key = new UniqueKey();
  int option;

  _RestartWidgetState(this.option);

  void restartApp() {
    this.setState(() {
      key = new UniqueKey();
    });
  }

  void setOption(int option) {
    this.option = option;
    this.setState(() {
      key = new UniqueKey();
    });
  }

  int getOption() {
    return option;
  }

  void closeApp() {
    this.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      key: key,
      child: widget.child,
    );
  }
}
