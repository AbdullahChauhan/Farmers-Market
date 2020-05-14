import 'package:farmers_market/app/styles/colors.dart';
import 'package:flutter/cupertino.dart';

abstract class VendorScaffold {
  static CupertinoTabScaffold get cupertinoTabScaffold {
    return CupertinoTabScaffold(
      tabBar: _cupertinoTabBar,
      tabBuilder: (context, index) {

      },
    );
  }

  static get _cupertinoTabBar {
    return CupertinoTabBar(  
      backgroundColor: AppColors.darkBlue,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(CupertinoIcons.create), title: Text('Product')),
        BottomNavigationBarItem(icon: Icon(CupertinoIcons.shopping_cart), title: Text('Orders')),
        BottomNavigationBarItem(icon: Icon(CupertinoIcons.person), title: Text('Profile'))
      ],
    );
  }

  static Widget _pageSelection(int index) {
    if(index == 0) {

    } else if(index == 1) {

    } else {

    }
  }
}