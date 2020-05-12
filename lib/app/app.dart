import 'package:farmers_market/app/blocs/auth_bloc.dart';
import 'package:farmers_market/app/models/user.dart';
import 'package:farmers_market/app/routes.dart';
import 'package:farmers_market/app/screens/landing.dart';
import 'package:farmers_market/app/screens/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';

import 'package:provider/provider.dart';

final authBloc = AuthBloc();

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return Provider(create: (context) => authBloc, child: PlatformApp());
  }

  @override
  void dispose() {
    authBloc.dispose();
    super.dispose();
  }
}

class PlatformApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return CupertinoApp(
        debugShowCheckedModeBanner: false,
        home: AuthWidget(isIOS: true,),
        onGenerateRoute: Routes.cupertinoRoutes,
        theme: CupertinoThemeData(
          scaffoldBackgroundColor: Colors.white,
        ),
      );
    }
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AuthWidget(isIOS: false,),
      onGenerateRoute: Routes.materialRoutes,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
      ),
    );
  }
}

class AuthWidget extends StatelessWidget {
  final bool isIOS;

  const AuthWidget({this.isIOS});

  @override
  Widget build(BuildContext context) {
    final authBloc = Provider.of<AuthBloc>(context);

    return StreamBuilder<User>(
      stream: authBloc.authState,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          final user = snapshot.data;
          return snapshot.hasData ? Landing() : Login();
        }
        return loadingScreen(isIOS);
      },
    );
  }

  Widget loadingScreen(bool isIOS) {
    return isIOS
        ? CupertinoPageScaffold(
            child: Center(
              child: CupertinoActivityIndicator(),
            ),
          )
        : Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
  }
}
