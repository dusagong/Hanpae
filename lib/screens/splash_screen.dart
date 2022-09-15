import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hanpae/providers/auth.dart';

import 'auth_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(Duration(seconds: 3), () {
      Get.offAll(auth());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      alignment: Alignment.center,
      children: [
        Container(
          color: Colors.green,
          child: Center(
              // child: Text(
              //   "Loading..."
              // )
              ),
        ),
        CircularProgressIndicator()
      ],
    ));
  }
}
