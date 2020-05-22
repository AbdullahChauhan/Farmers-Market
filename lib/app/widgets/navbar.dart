import 'package:farmers_market/app/styles/colors.dart';
import 'package:farmers_market/app/styles/text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class AppNavbar {

  static CupertinoSliverNavigationBar cupertinoNavBar ({String title}) {
    return CupertinoSliverNavigationBar(  
      largeTitle: Text(title, style: TextStyles.navTitleCupertino),
    );
  }

  static SliverAppBar materialNavBar({@required String title, TabBar tabBar}) {
    return SliverAppBar(
      title: Text(title, style: TextStyles.navTitleMaterial,),
      backgroundColor: AppColors.darkBlue,
      bottom: tabBar,
      floating: true,
      pinned: true,
      snap: true,
    );
  }
}