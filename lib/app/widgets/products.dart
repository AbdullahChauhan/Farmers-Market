import 'dart:io';

import 'package:cupertino_toolbar/cupertino_toolbar.dart';
import 'package:farmers_market/app/styles/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Products extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return CupertinoPageScaffold(
        child: CupertinoToolbar(
          body: _pageBody(context),
          items: [
            CupertinoToolbarItem(
              icon: CupertinoIcons.add_circled,
              onPressed: () => Navigator.of(context).pushNamed('/editproduct'),
            )
          ],
        ),
      );
    } else {
      return Scaffold(
        body: _pageBody(context),
        floatingActionButton: FloatingActionButton(
          backgroundColor: AppColors.straw,
          child: Icon(Icons.add),
          onPressed: () => Navigator.of(context).pushNamed('/editproduct'),
        ),
      );
    }
  }

  Widget _pageBody(BuildContext context) {
    return Center(
      child: Text('Products'),
    );
  }
}
