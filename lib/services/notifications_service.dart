import 'package:flutter/material.dart';

class NotificationsService {

  static GlobalKey<ScaffoldMessengerState> messengerKey =  new GlobalKey<ScaffoldMessengerState>();

  static showSnackBar (String msg) {

    
    final snackBar =  SnackBar(
      content: Text(
        msg,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 20
        ),
        textAlign: TextAlign.center
      ),
      backgroundColor: Colors.red,

    );

    // while (messengerKey.currentState == null) {
    //   print('waiting..');
    // }

    return messengerKey.currentState!.showSnackBar(snackBar);
    

  }

}