import 'dart:io';
import 'package:farmers_market/app/widgets/navbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Vendor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    if (Platform.isIOS) {
      return CupertinoPageScaffold(  
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled){
            return <Widget> [
              AppNavbar.cupertinoNavBar(title: 'Vendor Name', context:context),
            ];
          }, 
          body: Center(child: Text('Placeholder'),)),
      );
    } else {
      return Center(child: Scaffold(body: Text('Material'),));
    }
  }
}