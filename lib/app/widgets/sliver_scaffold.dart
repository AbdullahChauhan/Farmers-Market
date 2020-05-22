import 'package:farmers_market/app/widgets/navbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class AppSliverScaffold {
  static CupertinoPageScaffold cupertinoSliverScaffold(
      {String navTitle, Widget pageBody}) {
    return CupertinoPageScaffold(
      child: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            AppNavbar.cupertinoNavBar(title: navTitle),
          ];
        },
        body: pageBody,
      ),
    );
  }

  static Scaffold materialSliverScaffold(
    {String navTitle, Widget pageBody}
  ) {
    return Scaffold(  
      body: NestedScrollView(
            headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {  
              return <Widget> [
                AppNavbar.materialNavBar(title: navTitle)
              ];
            },
            body: pageBody
          ),
    );
  }
}
