import 'dart:io';
import 'package:farmers_market/app/widgets/navbar.dart';
import 'package:farmers_market/app/widgets/orders.dart';
import 'package:farmers_market/app/widgets/products.dart';
import 'package:farmers_market/app/widgets/profile.dart';
import 'package:farmers_market/app/widgets/vendor_scaffold.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Vendor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return CupertinoPageScaffold(
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              AppNavbar.cupertinoNavBar(title: 'Vendor Name', context: context),
            ];
          },
          body: VendorScaffold.cupertinoTabScaffold,
        ),
      );
    } else {
      return DefaultTabController(
        length: VendorScaffold.materialTabBar.tabs.length,
        child: Scaffold(
          body: NestedScrollView(
            headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {  
              return <Widget> [
                AppNavbar.materialNavBar(title: 'Vendor Name', tabBar: VendorScaffold.materialTabBar)
              ];
            },
            body: TabBarView(  
              children: [
                Products(),
                Orders(),
                Profile()
              ],
            ),
          )
        ),
      );
    }
  }
}
