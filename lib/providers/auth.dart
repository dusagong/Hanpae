import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hanpae/Widget/bottom_navigator.dart';
import 'package:hanpae/screens/auth_screen.dart';
import 'package:hanpae/providers/login_stream.dart';

class auth extends StatelessWidget {
  const auth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return FutureBuilder(
      future: Firebase.initializeApp(), 
      builder:(context, snapshot) {
        if(snapshot.hasError) {
          return Center(child: Text("Firebase load fail"),
          );
        }
        if(snapshot.connectionState == ConnectionState.done) {
          return loginStream();
        }
        return CircularProgressIndicator();
    },);
  }
}