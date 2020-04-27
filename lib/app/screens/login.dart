import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  List<dynamic> _users = [
    {'id': 0001, 'user': 'User1'},
    {'id': 0002, 'user': 'User2'},
    {'id': 0003, 'user': 'User3'},
    {'id': 0004, 'user': 'User4'},
    {'id': 0005, 'user': 'User5'}
  ];

  bool _lights = false;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text('My List'),
        ),
        child: Container(
          padding: EdgeInsets.all(8.0),
            child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: _users.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(_users[index]['user']),
                  );
                },
              ),
            ),
            Expanded(child: CupertinoDatePicker(onDateTimeChanged: (time) {})),
            CupertinoSwitch(
              value: _lights,
              onChanged: (bool value) {
                setState(() {
                  _lights = value;
                });
              },
            ),
            SizedBox(height: 8.0),
            CupertinoButton.filled(child: Text('AlertDialog'), onPressed: () {
              showAlertDialog(context: context, title: "Allow 'Maps' to access your location", content: 'Your current location will be displayed on the map and used for directions, nearby search results, and estimated travel times.', defaultActionText: 'Allow');
            })
          ],
        )));
  }
}

Future<void> showAlertDialog(
    {@required BuildContext context,
    @required String title,
    @required String content,
    @required String defaultActionText}) async {
  return await showCupertinoDialog(
    context: context,
    builder: (context) => CupertinoAlertDialog(
      title: Text(title),
      content: Text(content),
      actions: <Widget>[
        CupertinoDialogAction(
          child: Text(defaultActionText),
          onPressed: () => Navigator.of(context).pop(),
        )
      ],
    ),
  );
}
