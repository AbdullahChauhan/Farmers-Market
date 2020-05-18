import 'dart:io';

import 'package:farmers_market/app/blocs/auth_bloc.dart';
import 'package:farmers_market/app/widgets/button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return CupertinoPageScaffold(
        child: _pageBody(context),
      );
    } else {
      return Scaffold(body: _pageBody(context));
    }
  }

  Widget _pageBody(BuildContext context) {
    final authBloc = Provider.of<AuthBloc>(context);

    return Center(
      child: AppButton(
        isIOS: Platform.isIOS,
        text: 'Logout',
        onPressed: () => authBloc.logout(),
      ),
    );
  }
}
