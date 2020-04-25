import 'package:farmers_market/app/routes.dart';
import 'package:farmers_market/app/screens/login.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Login(),
      onGenerateRoute: Routes.materialRoutes,
    );
  }
}