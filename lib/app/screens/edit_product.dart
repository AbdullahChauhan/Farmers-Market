import 'package:farmers_market/app/styles/base.dart';
import 'package:farmers_market/app/styles/colors.dart';
import 'package:farmers_market/app/styles/text.dart';
import 'package:farmers_market/app/widgets/button.dart';
import 'package:farmers_market/app/widgets/sliver_scaffold.dart';
import 'package:farmers_market/app/widgets/textfield.dart';
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
      return AppSliverScaffold.cupertinoSliverScaffold(
          navTitle: '', pageBody: pageBody(context, true));
    } else {
      return AppSliverScaffold.materialSliverScaffold(
          navTitle: '', pageBody: pageBody(context, false));
    }
  }

  Widget pageBody(BuildContext context, bool isIOS) {
    return ListView(
      children: [
        Text(
          'Add Product',
          style: TextStyles.subTitle,
          textAlign: TextAlign.center,
        ),
        Padding(
          padding: BaseStyles.listPadding,
          child: Divider(
            color: AppColors.lightGray,
          ),
        ),
        AppTextField(
          isIOS: isIOS,
          hintText: 'Product Name',
          materialIcon: Icons.shopping_cart,
          cupertinoIcon: IconData(
                0xf3f8,
                fontFamily: CupertinoIcons.iconFont,
                fontPackage: CupertinoIcons.iconFontPackage,
              ),
          textInputAction: TextInputAction.next,
          onSubmitted: (_) => FocusScope.of(context).nextFocus(),
        ),
        AppTextField(
          isIOS: isIOS,
          hintText: 'Unit Type',
          materialIcon: Icons.view_list,
          cupertinoIcon: IconData(
                0xf454,
                fontFamily: CupertinoIcons.iconFont,
                fontPackage: CupertinoIcons.iconFontPackage,
              ),
          textInputAction: TextInputAction.next,
          onSubmitted: (_) => FocusScope.of(context).nextFocus(),
        ),
        AppTextField(
          isIOS: isIOS,
          hintText: 'Unit Price',
          materialIcon: Icons.local_offer,
          cupertinoIcon: IconData(
                0xf2aa,
                fontFamily: CupertinoIcons.iconFont,
                fontPackage: CupertinoIcons.iconFontPackage,
              ),
          textInputAction: TextInputAction.next,
          onSubmitted: (_) => FocusScope.of(context).nextFocus(),
        ),
        AppTextField(
          isIOS: isIOS,
          hintText: 'Available Units',
          materialIcon: Icons.check_circle,
          cupertinoIcon: IconData(
                0xf3ff,
                fontFamily: CupertinoIcons.iconFont,
                fontPackage: CupertinoIcons.iconFontPackage,
              ),
        ),
        AppButton(isIOS: isIOS, text: 'Add Image', buttonType: ButtonType.Straw, onPressed: () {},),
        AppButton(isIOS: isIOS, text: 'Save Product', buttonType: ButtonType.DarkBlue, onPressed: () {},),
      ],
    );
  }
}
