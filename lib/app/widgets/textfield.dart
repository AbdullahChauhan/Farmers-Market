import 'package:farmers_market/app/styles/text.dart';
import 'package:farmers_market/app/styles/textfields.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppTextField extends StatefulWidget {
  final bool isIOS;
  final String hintText;
  final IconData materialIcon;
  final IconData cupertinoIcon;
  final TextInputType textInputType;
  final bool obscureText;
  final void Function(String) onChanged;
  final String errorText;

  const AppTextField(
      {@required this.isIOS,
      @required this.hintText,
      @required this.materialIcon,
      @required this.cupertinoIcon,
      this.textInputType = TextInputType.text,
      this.obscureText = false,
      this.onChanged,
      this.errorText});

  @override
  _AppTextFieldState createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {

  FocusNode _node;

  @override
  void initState() {
    _node = FocusNode();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.isIOS) {
      return Padding(
        padding: EdgeInsets.symmetric(
          horizontal: TextFieldStyles.textBoxHorizontal,
          vertical: TextFieldStyles.textBoxVertical,
        ),
        child: Column(
          children: [
            CupertinoTextField(
              keyboardType: TextInputType.emailAddress,
              padding: EdgeInsets.all(12.0),
              placeholder: widget.hintText,
              placeholderStyle: TextFieldStyles.placeholder,
              style: TextFieldStyles.body,
              cursorColor: TextFieldStyles.cursorColor,
              prefix: TextFieldStyles.iconPrefix(widget.cupertinoIcon),
              obscureText: widget.obscureText,
              decoration: TextFieldStyles.cupertinoDecoration,
              onChanged: widget.onChanged,
              focusNode: _node,
            ),
            if (widget.errorText != null) Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(widget.errorText, style: TextStyles.error,),
            )
          ],
        ),
      );
    }
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: TextFieldStyles.textBoxHorizontal,
        vertical: TextFieldStyles.textBoxVertical,
      ),
      child: TextField(
        keyboardType: widget.textInputType,
        style: TextFieldStyles.body,
        cursorColor: TextFieldStyles.cursorColor,
        obscureText: widget.obscureText,
        decoration: TextFieldStyles.materialDecoration(
            widget.hintText, widget.materialIcon, widget.errorText),
        onChanged: widget.onChanged,
      ),
    );
  }

  @override
  void dispose() {
    _node.dispose();
    super.dispose();
  }
}
