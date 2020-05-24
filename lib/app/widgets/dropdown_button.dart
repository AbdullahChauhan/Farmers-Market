import 'dart:io';

import 'package:farmers_market/app/styles/base.dart';
import 'package:farmers_market/app/styles/buttons.dart';
import 'package:farmers_market/app/styles/colors.dart';
import 'package:farmers_market/app/styles/text.dart';
import 'package:flutter/material.dart';

class AppDropdownButton extends StatelessWidget {

  final List<String> items;
  final String hintText;
  final IconData materialIcon;
  final IconData cupertinoIcon;

  AppDropdownButton({
    @required this.items,
    @required this.hintText,
    this.materialIcon,
    this.cupertinoIcon
  });

  @override
  Widget build(BuildContext context) {
    if(Platform.isIOS) {
      return Container();
    } else {
      return Padding(
        padding: BaseStyles.listPadding,
        child: Container(
          height: ButtonStyles.buttonHeight,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.straw, width: BaseStyles.borderWidth),
            borderRadius: BorderRadius.circular(BaseStyles.borderRadius)
          ),
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.only(right: 4.0),
                child: BaseStyles.iconPrefix(materialIcon),
              ),
              DropdownButton<String>(
                items: buildMaterialItems(items),
                value: null,
                hint: Text(hintText, style: TextStyles.suggestion),
                style: TextStyles.body,
                underline: Container(),
                iconEnabledColor: AppColors.straw,
                onChanged: (value) {}
              ),
            ],
          ),
        ),
      );
    }
  }

  List<DropdownMenuItem<String>> buildMaterialItems(List<String> items) {
    return items.map((item) => DropdownMenuItem<String>(
      child: Text(item, textAlign: TextAlign.center),
      value: item
    )).toList();
  }
}