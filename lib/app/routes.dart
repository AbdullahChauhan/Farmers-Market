import 'package:farmers_market/app/screens/edit_product.dart';
import 'package:farmers_market/app/screens/landing.dart';
import 'package:farmers_market/app/screens/login.dart';
import 'package:farmers_market/app/screens/signup.dart';
import 'package:farmers_market/app/screens/vendor.dart';
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
      case '/vendor':
        return MaterialPageRoute(builder: (_) => Vendor());
      case '/editproduct':
        return MaterialPageRoute(builder: (_) => EditProduct());
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
      case '/vendor':
        return CupertinoPageRoute(builder: (_) => Vendor());
      case '/editproduct':
        return CupertinoPageRoute(builder: (_) => EditProduct());
      default:
        return CupertinoPageRoute(builder: (_) => Login());
    }
  }
}