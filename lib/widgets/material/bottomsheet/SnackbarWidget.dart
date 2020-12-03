/*
* File : Snack Bars
* Version : 1.0.0
* */

import 'package:UIKit/AppThemeNotifier.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';


import '../../../AppTheme.dart';

class SnackbarWidget extends StatefulWidget {
  @override
  _Widget createState() => _Widget();
}

class _Widget extends State<SnackbarWidget> with SingleTickerProviderStateMixin {

  ThemeData themeData;

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();


  Animation<double> animation;
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(duration: const Duration(seconds: 20),vsync: this);
    animation = Tween<double>(begin: 0,end: 3).animate(controller);
  }
  

  @override
  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    return Consumer<AppThemeNotifier>(
      builder: (BuildContext context, AppThemeNotifier value, Widget child) {
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.getThemeFromThemeMode(value.themeMode()),
            home: Scaffold(
                key: _scaffoldKey,
                appBar: AppBar(
                  backgroundColor: themeData.appBarTheme.color,
                  leading: IconButton(
                    onPressed: () => Navigator.of(context).pop(), icon: Icon(MdiIcons.chevronLeft),
                  ),
                  title: Text("Snack Bars",
                      style: AppTheme.getTextStyle(
                          themeData.textTheme.headline6,
                          fontWeight: 600)),
                ),
                body: Container(
                  height: double.infinity,
                  width: double.infinity,
                  color: themeData.backgroundColor,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: <Widget>[
                        FlatButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4)),
                            color: themeData.colorScheme.secondary,
                            splashColor: Colors.white,
                            onPressed: () {
                              showSimpleSnackbar();
                            },
                            child: Text(
                              "Simple snack bar",
                              style: themeData
                                  .textTheme
                                  .bodyText2
                                  .merge(TextStyle(
                                      color: themeData
                                          .colorScheme
                                          .onSecondary)),
                            )),
                        FlatButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4)),
                            color: themeData.colorScheme.secondary,
                            splashColor: Colors.white,
                            onPressed: () {
                              showSnackbarWithAction();
                            },
                            child: Text(
                              "Snack bar with actions",
                              style: themeData
                                  .textTheme
                                  .bodyText2
                                  .merge(TextStyle(
                                      color: themeData
                                          .colorScheme
                                          .onSecondary)),
                            )),
                        FlatButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4)),
                            color: themeData.colorScheme.secondary,
                            splashColor: Colors.white,
                            onPressed: () {
                              showSnackbarWithFloating();
                            },
                            child: Text(
                              "Floating snackbar",
                              style: themeData
                                  .textTheme
                                  .bodyText2
                                  .merge(TextStyle(
                                      color: themeData
                                          .colorScheme
                                          .onSecondary)),
                            )),
                        FlatButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4)),
                            color: themeData.colorScheme.secondary,
                            splashColor: Colors.white,
                            onPressed: () {
                              showSnackbarWithFloatingAction();
                            },
                            child: Text(
                              "Floating snackbar with action",
                              style: themeData
                                  .textTheme
                                  .bodyText2
                                  .merge(TextStyle(
                                      color: themeData
                                          .colorScheme
                                          .onSecondary)),
                            )),
                      ],
                    ),
                  ),
                )));
      },
    );
  }

  void showSimpleSnackbar() {
    _scaffoldKey.currentState.showSnackBar(
      new SnackBar(
        content: new Text(
          "This is simple snack bar",
          style: themeData
              .textTheme
              .subtitle2
              .merge(TextStyle(color: themeData.colorScheme.onPrimary)),
        ),
        backgroundColor: themeData.colorScheme.primary,
      ),
    );
  }

  void showSnackbarWithAction() {
    _scaffoldKey.currentState.showSnackBar(
      new SnackBar(
        content: new Text(
          "Message has been deleted",
          style: themeData
              .textTheme
              .subtitle2
              .merge(TextStyle(color: themeData.colorScheme.onPrimary)),
        ),
        backgroundColor: themeData.colorScheme.primary,
        action: SnackBarAction(
          onPressed: () {},
          label: "Undo",
          textColor: themeData.colorScheme.onPrimary,
        ),
      ),
    );
  }

  void showSnackbarWithFloating(){
    _scaffoldKey.currentState.showSnackBar(
      new SnackBar(
        content: new Text(
          "Message has been deleted",
          style: themeData
              .textTheme
              .subtitle2
              .merge(TextStyle(color: themeData.colorScheme.onPrimary)),
        ),
        backgroundColor: themeData.colorScheme.primary,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
  void showSnackbarWithFloatingAction(){
    _scaffoldKey.currentState.showSnackBar(
      new SnackBar(
        content: new Text(
          "Message has been deleted",
          style: themeData
              .textTheme
              .subtitle2
              .merge(TextStyle(color: themeData.colorScheme.onPrimary)),
        ),
        backgroundColor: themeData.colorScheme.primary,
        action: SnackBarAction(
          onPressed: () {},
          label: "Undo",
          textColor: themeData.colorScheme.onPrimary,
        ),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}
