import 'package:farmers_market/app/styles/base.dart';
import 'package:farmers_market/app/styles/buttons.dart';
import 'package:farmers_market/app/styles/colors.dart';
import 'package:farmers_market/app/styles/text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final bool isIOS;
  final String text;
  final ButtonType buttonType;
  final VoidCallback onPressed;


  const AppButton({@required this.isIOS, @required this.text, this.buttonType, @required this.onPressed});

  @override
  Widget build(BuildContext context) {

    TextStyle fontStyle;
    Color buttonColor;

    switch (buttonType) {
      case ButtonType.Straw:
        fontStyle = TextStyles.buttonTextLight;
        buttonColor = AppColors.straw;
        break;
      case ButtonType.LightGray:
        fontStyle = TextStyles.buttonTextDark;
        buttonColor = AppColors.lightGray;
        break;
      case ButtonType.DarkGray:
        fontStyle = TextStyles.buttonTextLight;
        buttonColor = AppColors.darkGray;
        break;
      case ButtonType.DarkBlue:
        fontStyle = TextStyles.buttonTextLight;
        buttonColor = AppColors.darkBlue;
        break;
      default:
        fontStyle = TextStyles.buttonTextLight;
        buttonColor = AppColors.lightBlue;
        break;
    }

    return Padding(
      padding: BaseStyles.listPadding,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: ButtonStyles.buttonHeight,
        child: isIOS
            ? CupertinoButton(
                color: buttonColor,
                borderRadius: BorderRadius.circular(BaseStyles.borderRadius),
                child: Text(
                  text,
                  style: fontStyle,
                ),
                onPressed: onPressed,
              )
            : RaisedButton(
                color: buttonColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(BaseStyles.borderRadius),
                ),
                child: Text(
                  text,
                  style: fontStyle,
                ),
                onPressed: onPressed,
              ),
      ),
    );
  }
}

enum ButtonType { LightBlue, Straw, LightGray, DarkGray, DarkBlue }
