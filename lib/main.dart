/*
* File : Main File
* Version : 1.0.0
* */

import 'package:UIKit/AppTheme.dart';
import 'package:UIKit/AppThemeNotifier.dart';
import 'package:UIKit/CupertinoWidgetsHome.dart';
import 'package:UIKit/MaterialWidgetsHome.dart';
import 'package:UIKit/ScreensHome.dart';
import 'package:UIKit/screens/SelectThemeDialog.dart';
import 'package:UIKit/utils/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

void main() {

  //You will need to initialize AppThemeNotifier class for theme changes.
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(ChangeNotifierProvider<AppThemeNotifier>(
      create: (context) => AppThemeNotifier(),
      child: MyApp(),
    ));
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppThemeNotifier>(
      builder: (BuildContext context, AppThemeNotifier value, Widget child) {
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.getThemeFromThemeMode(value.themeMode()),
            home: MyHomePage());
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedPage = 2;
  ThemeData themeData;

  final List<Widget> _fragmentView = [
    MaterialWidgetsHome(),
    CupertinoWidgetsHome(),
    ScreensHome(),
  ];

  final List<String> _fragmentTitle = [
    "Material Widgets",
    "Cupertino Widgets",
    "Screens",
  ];

  @override
  Widget build(BuildContext context) {
    //You will need to initialize MySize class for responsive spaces.
    MySize().init(context);
    themeData = Theme.of(context);
    return Scaffold(
      backgroundColor: themeData.colorScheme.background,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: themeData.appBarTheme.color,
        title: Text(_fragmentTitle[_selectedPage],
            style: AppTheme.getTextStyle(themeData.textTheme.headline6,
                fontWeight:600)),
      ),
      body: _fragmentView[_selectedPage],
      drawer: Drawer(
          child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              flex: 2,
              child: DrawerHeader(
                padding: EdgeInsets.all(0),
                margin: EdgeInsets.all(0),
                child: Container(
                  child: Padding(
                    padding: EdgeInsets.only(left: 16.0, bottom: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                          flex: 1,
                          child: Center(
                            child: Image(
                                image: AssetImage("./assets/brand/flutkit.png"),
                                height: 102,
                                width: 102,
                                color: themeData.colorScheme.onPrimary),
                          ),
                        ),
                        Column(
                          children: <Widget>[
                            Text("v. 2.0.0",
                                style: AppTheme.getTextStyle(
                                    themeData.textTheme.subtitle2,
                                    color: themeData.colorScheme.onPrimary))
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                decoration: BoxDecoration(color: themeData.primaryColor),
              ),
            ),
            Container(
              color: themeData.backgroundColor,
              child: ListTile(
                onTap: () {
                  Navigator.of(context).pop();
                  showDialog(
                      context: context,
                      builder: (BuildContext context) => SelectThemeDialog());
                },
                title: Text(
                  "Select Theme",
                  style: AppTheme.getTextStyle(themeData.textTheme.subtitle2,
                      fontWeight: 600),
                ),
                trailing: Icon(Icons.chevron_right,
                    color: themeData.colorScheme.onBackground),
              ),
            ),
            Expanded(
              flex: 5,
              child: Container(
                color: themeData.backgroundColor,
                child: Column(
                  children: <Widget>[
                    ListTile(
                      leading: Icon(MdiIcons.materialDesign,
                          color: _selectedPage == 0
                              ? themeData.colorScheme.primary
                              : themeData.colorScheme.onBackground),
                      title: Text("Material Widget",
                          style: AppTheme.getTextStyle(
                              themeData.textTheme.subtitle2,
                              fontWeight: _selectedPage == 0
                                  ? 700
                                  : 600,
                              color: _selectedPage == 0
                                  ? themeData.colorScheme.primary
                                  : themeData.colorScheme.onBackground)),
                      onTap: () {
                        setState(() {
                          _selectedPage = 0;
                        });
                        Navigator.of(context).pop();
                      },
                    ),
                    ListTile(
                      leading: Icon(MdiIcons.appleIos,
                          color: _selectedPage == 1
                              ? themeData.colorScheme.primary
                              : themeData.colorScheme.onBackground),
                      title: Text("Cupertino Widget",
                          style: AppTheme.getTextStyle(
                              themeData.textTheme.subtitle2,
                              fontWeight: _selectedPage == 1
                                  ? 700
                                  : 600,
                              color: _selectedPage == 1
                                  ? themeData.colorScheme.primary
                                  : themeData.colorScheme.onBackground)),
                      onTap: () {
                        setState(() {
                          _selectedPage = 1;
                        });
                        Navigator.of(context).pop();
                      },
                    ),
                    ListTile(
                      leading: Icon(
                        MdiIcons.cropLandscape,
                        color: _selectedPage == 2
                            ? themeData.colorScheme.primary
                            : themeData.colorScheme.onBackground,
                        size: 24,
                      ),
                      title: Text("Screens",
                          style: AppTheme.getTextStyle(
                              themeData.textTheme.subtitle2,
                              fontWeight: _selectedPage == 2
                                  ?700
                                  : 600,
                              color: _selectedPage == 2
                                  ? themeData.colorScheme.primary
                                  : themeData.colorScheme.onBackground)),
                      onTap: () {
                        setState(() {
                          _selectedPage = 2;
                        });
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}
