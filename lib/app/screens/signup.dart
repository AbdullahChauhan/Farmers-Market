import 'dart:io';
import 'package:farmers_market/app/blocs/auth_bloc.dart';
import 'package:farmers_market/app/styles/base.dart';
import 'package:farmers_market/app/styles/text.dart';
import 'package:farmers_market/app/widgets/button.dart';
import 'package:farmers_market/app/widgets/textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:provider/provider.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  @override
  void initState() {
    final authBloc = Provider.of<AuthBloc>(context, listen: false);
    authBloc.user.listen((user) {
      if(user != null) Navigator.pushReplacementNamed(context, '/landing');
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    final authBloc = Provider.of<AuthBloc>(context);

    if (Platform.isIOS) {
      return CupertinoPageScaffold(
        child: _pageBody(context, authBloc),
      );
    }

    return Scaffold(
      body: _pageBody(context, authBloc),
    );
  }

  Widget _pageBody(BuildContext context, AuthBloc authBloc) {
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
        StreamBuilder<String>(
          stream: authBloc.email,
          builder: (_, snapshot) {
            return AppTextField(
              isIOS: Platform.isIOS,
              textInputType: TextInputType.emailAddress,
              hintText: 'Email address',
              materialIcon: Icons.email,
              cupertinoIcon: CupertinoIcons.mail_solid,
              onChanged: authBloc.changeEmail,
              errorText: snapshot.error,
            );
          }
        ),
        StreamBuilder<String>(
          stream: authBloc.password,
          builder: (_, snapshot) {
            return AppTextField(
              isIOS: Platform.isIOS,
              hintText: 'Password',
              materialIcon: Icons.lock,
              cupertinoIcon: IconData(
                0xf4c9,
                fontFamily: CupertinoIcons.iconFont,
                fontPackage: CupertinoIcons.iconFontPackage,
              ),
              obscureText: true,
              onChanged: authBloc.changePassword,
              errorText: snapshot.error,
            );
          }
        ),
        StreamBuilder<bool>(
          stream: authBloc.isValid,
          builder: (_, snapshot) {
            return AppButton(
              isIOS: Platform.isIOS,
              text: 'Signup',
              buttonType: ButtonType.LightBlue,
              onPressed: snapshot.data == true ? authBloc.signupEmail : null,
            );
          }
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
              text: 'Already have an account? ',
              style: TextStyles.body,
              children: [
                TextSpan(text: 'Login',
                style: TextStyles.link,
                  recognizer: TapGestureRecognizer() ..onTap = () => Navigator.pushNamed(context, '/login')
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
