import 'package:farmers_market/app/routes.dart';
import 'package:farmers_market/app/screens/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PlatformApp();
  }
}

class PlatformApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return CupertinoApp(
        debugShowCheckedModeBanner: false,
        home: Login(),
        onGenerateRoute: Routes.cupertinoRoutes,
        theme: CupertinoThemeData(
          scaffoldBackgroundColor: Colors.white,
        ),
      );
    }
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Login(),
      onGenerateRoute: Routes.materialRoutes,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
      ),
    );
  }
}
