import 'package:farmers_market/app/styles/colors.dart';
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
  final TextInputAction textInputAction;
  final bool obscureText;
  final void Function(String) onChanged;
  final void Function(String) onSubmitted;
  final String errorText;

  const AppTextField(
      {@required this.isIOS,
      @required this.hintText,
      @required this.materialIcon,
      @required this.cupertinoIcon,
      this.textInputType = TextInputType.text,
      this.textInputAction = TextInputAction.done,
      this.obscureText = false,
      this.onChanged,
      this.onSubmitted,
      this.errorText});

  @override
  _AppTextFieldState createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  FocusNode _node;
  bool _displayCupertinoErrorBorder;
  TextEditingController _controller;
  bool _isPasswordHidden;

  @override
  void initState() {
    _node = FocusNode();
    _node.addListener(_handleFocusChange);
    _displayCupertinoErrorBorder = false;
    _controller = TextEditingController();
    _isPasswordHidden = true;
    super.initState();
  }

  void _handleFocusChange() {
    if (_node.hasFocus == false && widget.errorText != null) {
      _displayCupertinoErrorBorder = true;
    } else {
      _displayCupertinoErrorBorder = false;
    }
    widget.onChanged(_controller.text);
  }

  void _togglePasswordVisibility() {
    setState(() {
      _isPasswordHidden = !_isPasswordHidden;
    });
  }

  Widget _togglePasswordButton(Icon iconData1, Icon iconData2) {
    return widget.hintText == "Password"
        ? IconButton(
            onPressed: _togglePasswordVisibility,
            icon: _isPasswordHidden
                ? iconData1
                : iconData2,
          )
        : null;
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
              controller: _controller,
              keyboardType: widget.textInputType,
              textInputAction: widget.textInputAction,
              padding: EdgeInsets.all(12.0),
              placeholder: widget.hintText,
              placeholderStyle: TextFieldStyles.placeholder,
              style: TextFieldStyles.body,
              cursorColor: TextFieldStyles.cursorColor,
              prefix: TextFieldStyles.iconPrefix(widget.cupertinoIcon),
              suffix: _togglePasswordButton(Icon(IconData(
                0xf424,
                fontFamily: CupertinoIcons.iconFont,
                fontPackage: CupertinoIcons.iconFontPackage,
              )), Icon(IconData(
                0xf425,
                fontFamily: CupertinoIcons.iconFont,
                fontPackage: CupertinoIcons.iconFontPackage,
              ), color: AppColors.lightBlue,),),
              obscureText: widget.obscureText ? _isPasswordHidden : false,
              decoration: _displayCupertinoErrorBorder
                  ? TextFieldStyles.cupertinoErrorDecoration
                  : TextFieldStyles.cupertinoDecoration,
              onChanged: widget.onChanged,
              onSubmitted: widget.onSubmitted,
              focusNode: _node,
            ),
            if (widget.errorText != null)
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  widget.errorText,
                  style: TextStyles.error,
                ),
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
        textInputAction: widget.textInputAction,
        style: TextFieldStyles.body,
        cursorColor: TextFieldStyles.cursorColor,
        obscureText: widget.obscureText ? _isPasswordHidden : false,
        decoration: TextFieldStyles.materialDecoration(
            widget.hintText,
            widget.materialIcon,
            widget.errorText,
            _togglePasswordVisibility,
            _isPasswordHidden, _togglePasswordButton(Icon(Icons.visibility_off, color: AppColors.lightBlue,), Icon(Icons.visibility, color: AppColors.lightBlue))),
        onChanged: widget.onChanged,
        onSubmitted: widget.onSubmitted,
      ),
    );
  }

  @override
  void dispose() {
    _node.removeListener(_handleFocusChange);
    _node.dispose();
    _controller.dispose();
    super.dispose();
  }
}
