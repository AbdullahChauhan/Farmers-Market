import 'dart:async';
import 'dart:io';
import 'package:farmers_market/app/blocs/auth_bloc.dart';
import 'package:farmers_market/app/widgets/navbar.dart';
import 'package:farmers_market/app/widgets/orders.dart';
import 'package:farmers_market/app/widgets/products.dart';
import 'package:farmers_market/app/widgets/profile.dart';
import 'package:farmers_market/app/widgets/vendor_scaffold.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Vendor extends StatefulWidget {
  @override
  _VendorState createState() => _VendorState();
}

class _VendorState extends State<Vendor> {

  StreamSubscription _userSubscription;

  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      final authBloc = Provider.of<AuthBloc>(context, listen: false);
      _userSubscription = authBloc.user.listen((user) {
        if (user == null) Navigator.of(context).pushNamedAndRemoveUntil('/login', (route) => false);
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _userSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return CupertinoPageScaffold(
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              AppNavbar.cupertinoNavBar(title: 'Vendor Name'),
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
