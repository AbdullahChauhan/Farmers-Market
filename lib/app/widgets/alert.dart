import 'package:farmers_market/app/styles/text.dart';
import 'package:flutter/material.dart';

abstract class AppAlert {
  static Future<void> showErrorDialog(BuildContext context, String errorMessage) async {
    return await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: Text('Error', style: TextStyles.subTitle,),
          content: SingleChildScrollView( 
            child: ListBody( 
              children: [
                Text(errorMessage, style: TextStyles.body,)
              ],
            ),
          ),
          actions: [
            FlatButton(  
              child: Text('Ok', style: TextStyles.body,),
              onPressed: () => Navigator.of(context).pop(),
            )
          ],
        );
      }
    );
  }
}