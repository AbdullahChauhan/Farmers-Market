import 'package:farmers_market/app/styles/textfields.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  final bool isIOS;
  final String hintText;
  final IconData materialIcon;
  final IconData cupertinoIcon;
  final TextInputType textInputType;
  final bool obscureText;

  const AppTextField({
    @required this.isIOS,
    @required this.hintText,
    @required this.materialIcon,
    @required this.cupertinoIcon,
    this.textInputType = TextInputType.text,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    if (isIOS) {
      return Padding(
        padding: EdgeInsets.symmetric(
          horizontal: TextFieldStyles.textBoxHorizontal,
          vertical: TextFieldStyles.textBoxVertical,
        ),
        child: CupertinoTextField(
            keyboardType: TextInputType.emailAddress,
            padding: EdgeInsets.all(12.0),
            placeholder: hintText,
            placeholderStyle: TextFieldStyles.placeholder,
            style: TextFieldStyles.body,
            cursorColor: TextFieldStyles.cursorColor,
            prefix: TextFieldStyles.iconPrefix(cupertinoIcon),
            obscureText: obscureText,
            decoration: TextFieldStyles.cupertinoDecoration),
      );
    }
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: TextFieldStyles.textBoxHorizontal,
        vertical: TextFieldStyles.textBoxVertical,
      ),
      child: TextField(
        keyboardType: textInputType,
        style: TextFieldStyles.body,
        cursorColor: TextFieldStyles.cursorColor,
        obscureText: obscureText,
        decoration: TextFieldStyles.materialDecoration(hintText, materialIcon),
      ),
    );
  }
}
