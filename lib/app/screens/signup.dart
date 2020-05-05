import 'dart:io';
import 'package:farmers_market/app/styles/base.dart';
import 'package:farmers_market/app/styles/text.dart';
import 'package:farmers_market/app/widgets/button.dart';
import 'package:farmers_market/app/widgets/textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

class SignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return CupertinoPageScaffold(
        child: _pageBody(context),
      );
    }

    return Scaffold(
      body: _pageBody(context),
    );
  }

  Widget _pageBody(BuildContext context) {
    return ListView(
      // padding: EdgeInsets.all(0.0),
      children: [
        Container(
          height: MediaQuery.of(context).size.height * .2,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                'assets/images/top_bg.png',
              ),
              fit: BoxFit.fill,
            ),
          ),
        ),
        Container(
          height: 200,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/logo.png'),
            ),
          ),
        ),
        AppTextField(
          isIOS: Platform.isIOS,
          hintText: 'Email address',
          materialIcon: Icons.email,
          cupertinoIcon: CupertinoIcons.mail_solid,
        ),
        AppTextField(
          isIOS: Platform.isIOS,
          hintText: 'Password',
          materialIcon: Icons.lock,
          cupertinoIcon: IconData(
            0xf4c9,
            fontFamily: CupertinoIcons.iconFont,
            fontPackage: CupertinoIcons.iconFontPackage,
          ),
          obscureText: true,
        ),
        AppButton(
          isIOS: Platform.isIOS,
          text: 'Login',
          buttonType: ButtonType.DarkGray,
          onPressed: () => print('Clicked'),
        ),
        Padding(
          padding: BaseStyles.listPadding,
          child: Row(
            children: <Widget>[
              Expanded(
                  child: Divider(
                height: 2.0,
                color: Colors.grey,
                indent: 50,
                endIndent: 10,
              )),
              Text('OR'),
              Expanded(
                  child: Divider(
                height: 2.0,
                color: Colors.grey,
                indent: 10,
                endIndent: 50,
              )),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SignInButton(
              Buttons.Facebook,
              mini: true,
              onPressed: () {},
            ),
            SignInButton(
              Buttons.GoogleDark,
              onPressed: () {},
            )
          ],
        ),
        Padding(
          padding: BaseStyles.listPadding,
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              text: 'New Here? ',
              style: TextStyles.body,
              children: [
                TextSpan(text: 'Signup',
                style: TextStyles.link,
                  recognizer: TapGestureRecognizer() ..onTap = () => Navigator.pushNamed(context, '/signup')
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
