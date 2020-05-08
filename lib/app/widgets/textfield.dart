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
  bool _displayCupertinoErrorBorder;
  TextEditingController _controller;

  @override
  void initState() {
    _node = FocusNode();
    _node.addListener(_handleFocusChange);
    _displayCupertinoErrorBorder = false;
    _controller = TextEditingController();
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
              keyboardType: TextInputType.emailAddress,
              padding: EdgeInsets.all(12.0),
              placeholder: widget.hintText,
              placeholderStyle: TextFieldStyles.placeholder,
              style: TextFieldStyles.body,
              cursorColor: TextFieldStyles.cursorColor,
              prefix: TextFieldStyles.iconPrefix(widget.cupertinoIcon),
              obscureText: widget.obscureText,
              decoration: _displayCupertinoErrorBorder
                  ? TextFieldStyles.cupertinoErrorDecoration
                  : TextFieldStyles.cupertinoDecoration,
              onChanged: widget.onChanged,
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
    _node.removeListener(_handleFocusChange);
    _node.dispose();
    _controller.dispose();
    super.dispose();
  }
}
