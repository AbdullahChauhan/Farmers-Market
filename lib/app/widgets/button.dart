import 'package:farmers_market/app/styles/buttons.dart';
import 'package:farmers_market/app/styles/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final bool isIOS;
  final String text;

  const AppButton({@required this.isIOS, @required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: ButtonStyles.buttonHeight,
      child: isIOS
          ? CupertinoButton(
            color: AppColors.lightBlue,
            borderRadius: BorderRadius.circular(32),
              child: Text(text),
              onPressed: () {},
            )
          : RaisedButton(
            color: AppColors.lightBlue,
            shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(32),
                                ),
              child: Text(text),
              onPressed: () {},
            ),
    );
  }
}
