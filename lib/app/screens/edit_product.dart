import 'package:farmers_market/app/widgets/sliver_scaffold.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class EditProduct extends StatefulWidget {
  @override
  _EditProductState createState() => _EditProductState();
}

class _EditProductState extends State<EditProduct> {
  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return AppSliverScaffold.cupertinoSliverScaffold(navTitle: '', pageBody: pageBody(context));
    } else {
      return AppSliverScaffold.materialSliverScaffold(navTitle: '', pageBody: pageBody(context));
    }
  }

  Widget pageBody(BuildContext context) {
    
  }
}