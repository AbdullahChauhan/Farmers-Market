import 'package:farmers_market/app/blocs/auth_bloc.dart';
import 'package:farmers_market/app/routes.dart';
import 'package:farmers_market/app/screens/landing.dart';
import 'package:farmers_market/app/screens/login.dart';
import 'package:farmers_market/app/styles/colors.dart';
import 'package:farmers_market/app/styles/text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:provider/provider.dart';

final authBloc = AuthBloc();
final productBloc = ProductBloc();
final firestoreService = FirestoreService();

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (context) => authBloc),
	Provider(create: (context) => productBloc),
        FutureProvider(create: (context) => authBloc.isLoggedIn()),
	StreamProvider(create: (context) => firestoreService.fetchUnitTypes())
      ],
      child: PlatformApp());
  }

  @override
  void dispose() {
    authBloc.dispose();
	productBloc.displose();
    super.dispose();
  }
}

class PlatformApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    var isLoggedIn = Provider.of<bool>(context);

    if (Platform.isIOS) {
      return CupertinoApp(
        debugShowCheckedModeBanner: false,
        home: (isLoggedIn == null) ? loadingScreen(true) : (isLoggedIn == true ) ? Landing() : Login(),
        onGenerateRoute: Routes.cupertinoRoutes,
        theme: CupertinoThemeData(
          scaffoldBackgroundColor: Colors.white,
          primaryColor: AppColors.straw,
          textTheme: CupertinoTextThemeData( 
            tabLabelTextStyle: TextStyles.suggestion
          )
        ),
      );
    }
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: (isLoggedIn == null) ? loadingScreen(false) : (isLoggedIn == true ) ? Landing() : Login(),
      onGenerateRoute: Routes.materialRoutes,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
      ),
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
