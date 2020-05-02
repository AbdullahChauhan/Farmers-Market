import 'dart:io';
import 'package:farmers_market/app/styles/textfields.dart';
import 'package:farmers_market/app/widgets/textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
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
          cupertinoIcon: IconData(0xf4c9, fontFamily: CupertinoIcons.iconFont, fontPackage: CupertinoIcons.iconFontPackage),
          obscureText: true,
        )
      ],
    );
  }
}
