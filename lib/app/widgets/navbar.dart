import 'package:farmers_market/app/styles/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class AppNavbar {

  static CupertinoSliverNavigationBar cupertinoNavBar ({String title, BuildContext context}) {
    return CupertinoSliverNavigationBar(  
      largeTitle: Text(title),
    );
  }

  static SliverAppBar materialNavBar({@required String title, @required TabBar tabBar}) {
    return SliverAppBar(
      title: Text(title),
      backgroundColor: AppColors.darkBlue,
      bottom: tabBar,
    );
  }
}