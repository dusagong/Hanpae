import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hanpae/Widget/bottom_navigator.dart';
import 'package:hanpae/screens/auth_screen.dart';

class loginStream extends StatelessWidget {
  const loginStream({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, AsyncSnapshot <User?> snapshot) {
          if(!snapshot.hasData) {
            return LogIn();
          } else {
            return MyStatefulWidget();
          }
        },
      ),
    ); 
  }
}