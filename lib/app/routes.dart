import 'package:farmers_market/app/screens/landing.dart';
import 'package:farmers_market/app/screens/login.dart';
import 'package:farmers_market/app/screens/signup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class Routes {
  static MaterialPageRoute materialRoutes(RouteSettings settings) {
    switch(settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => Landing());
        break;
      case '/signup':
        return MaterialPageRoute(builder: (_) => SignUp());
        break;
      case '/login':
        return MaterialPageRoute(builder: (_) => Login());
        break;
      default:
        return MaterialPageRoute(builder: (_) => Login());
        break;
    }
  }

  static CupertinoPageRoute cupertinoRoutes(RouteSettings settings) {
    switch(settings.name) {
      case '/':
        return CupertinoPageRoute(builder: (_) => Landing());
        break;
      case '/signup':
        return CupertinoPageRoute(builder: (_) => SignUp());
        break;
      case '/login':
        return CupertinoPageRoute(builder: (_) => Login());
        break;
      default:
        return CupertinoPageRoute(builder: (_) => Login());
        break;
    }
  }
}