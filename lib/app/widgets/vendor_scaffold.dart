import 'package:farmers_market/app/styles/colors.dart';
import 'package:farmers_market/app/styles/tabBar.dart';
import 'package:farmers_market/app/widgets/orders.dart';
import 'package:farmers_market/app/widgets/products.dart';
import 'package:farmers_market/app/widgets/profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class VendorScaffold {
  static CupertinoTabScaffold get cupertinoTabScaffold {
    return CupertinoTabScaffold(
      tabBar: _cupertinoTabBar,
      tabBuilder: (context, index) => _pageSelection(index),
    );
  }

  static get _cupertinoTabBar {
    return CupertinoTabBar(
      backgroundColor: AppColors.darkBlue,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.create), title: Text('Product')),
        BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.shopping_cart), title: Text('Orders')),
        BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.person), title: Text('Profile'))
      ],
    );
  }

  static Widget _pageSelection(int index) {
    if (index == 0) {
      return Products();
    }

    if (index == 1) {
      return Orders();
    }

    return Profile();
  }

  static TabBar get materialTabBar {
    return TabBar(
      unselectedLabelColor: TabBarStyles.unselectedLabelColor,
      labelColor: TabBarStyles.labelColor,
      indicatorColor: TabBarStyles.indicatorColor,
      tabs: <Widget>[
        Tab(  
          icon: Icon(Icons.list),
        ),
        Tab(  
          icon: Icon(Icons.shopping_cart),
        ),
        Tab(  
          icon: Icon(Icons.person),
        ),
      ],
    );
  } 
}
