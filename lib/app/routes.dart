import 'package:farmers_market/app/screens/landing.dart';
import 'package:farmers_market/app/screens/login.dart';
import 'package:farmers_market/app/screens/signup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class Routes {
  static MaterialPageRoute materialRoutes(RouteSettings settings) {
    switch(settings.name) {
      case '/landing':
        return MaterialPageRoute(builder: (_) => Landing());
      case '/signup':
        return MaterialPageRoute(builder: (_) => SignUp());
      case '/login':
        return MaterialPageRoute(builder: (_) => Login());
      default:
        return MaterialPageRoute(builder: (_) => Login());
    }
  }

  static CupertinoPageRoute cupertinoRoutes(RouteSettings settings) {
    switch(settings.name) {
      case '/':
        return CupertinoPageRoute(builder: (_) => Landing());
      case '/signup':
        return CupertinoPageRoute(builder: (_) => SignUp());
      case '/login':
        return CupertinoPageRoute(builder: (_) => Login());
      default:
        return CupertinoPageRoute(builder: (_) => Login());
    }
  }
}