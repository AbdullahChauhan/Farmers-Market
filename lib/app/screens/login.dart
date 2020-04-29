import 'dart:io';

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
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: emailField(),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
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
