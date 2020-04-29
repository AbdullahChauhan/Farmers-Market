import 'dart:io';

import 'package:farmers_market/app/styles/textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if(Platform.isIOS) {
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
              image: AssetImage('assets/images/top_bg.png'),
              fit: BoxFit.fill
            )
          ),
        ),
        Container(
          height: 200,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/logo.png'),
            )
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: TextFieldStyles.textBoxHorizontal(), vertical: TextFieldStyles.textBoxVertical()),
          child: emailField(),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: TextFieldStyles.textBoxHorizontal(), vertical: TextFieldStyles.textBoxVertical()),
          child: passwordField(),
        )
      ],
    );
  }

  Widget emailField() {
    if(Platform.isIOS) {
      return CupertinoTextField();
    }
    return TextField();
  }

  Widget passwordField() {
    if(Platform.isIOS) {
      return CupertinoTextField();
    }
    return TextField();
  }
}
