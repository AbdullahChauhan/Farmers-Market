import 'package:farmers_market/app/blocs/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Landing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final authBloc = Provider.of<AuthBloc>(context);

    return Scaffold(
      body: Center(child: RaisedButton(child: Text('logout'), onPressed: authBloc.signout,),),
    );
  }
}
