import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hanpae/widget/bottom_navigator.dart';

class LogIn extends StatefulWidget {
  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn>{

  FirebaseFirestore fireStore = FirebaseFirestore.instance;
  final _authentication = FirebaseAuth.instance;

  Future<UserCredential> signInWithGoogle() async {
  // Trigger the authentication flow
  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  // Obtain the auth details from the request
  final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

  // Create a new credential
  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken,
    idToken: googleAuth?.idToken,
  );

  // Once signed in, return the UserCredential
  return await FirebaseAuth.instance.signInWithCredential(credential);
}

  String idInput = ' ';
  String pwdInput = ' ';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Log in'),
        backgroundColor: Color.fromARGB(255, 119, 224, 90),
        centerTitle: true,
        actions: <Widget>[
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(padding: (EdgeInsets.only(top: 50)),
            ),
            Form(child: Theme(
              data: ThemeData(
                primaryColor: Colors.teal,
                inputDecorationTheme: InputDecorationTheme(
                  labelStyle: TextStyle(
                    color: Colors.teal,
                    fontSize: 15.0
                  )
                ),
              ),
              child: Container(
                padding: EdgeInsets.all(40.0),
                child: Column(
                  children: [
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Enter "ID"'
                    ),
                     onChanged: (value){
                        idInput = value;
                      },
                    keyboardType: TextInputType.emailAddress,
                  ),
                    TextField(
                      decoration: InputDecoration(
                          labelText: 'Enter "Password"'
                      ),
                      onChanged: (value){
                        pwdInput = value;
                      },
                      keyboardType: TextInputType.text,
                      obscureText: true,
                    ),
                    SizedBox(
                      height: 40.0,
                    ),
                    ButtonTheme(
                      minWidth: 100.0 ,
                        height: 50.0,
                        child: RaisedButton(
                            color: Colors.orangeAccent,
                              child: Icon(
                                Icons.arrow_forward,
                              color: Colors.white,
                              size: 35.0,
                              ),

                             //이게된다 로그인   
                            onPressed: () async {
                              print(idInput);
                              print(pwdInput);

                              try{
                                final newUser = 
                                await _authentication.signInWithEmailAndPassword(
                                email:  idInput,
                                password: pwdInput
                                );

                                Get.offAll(MyStatefulWidget());
                              } catch(e){
                                print(e);
                              }

                            // 이것도 된다 회원가입
                              try{
                                final newUser = await _authentication.createUserWithEmailAndPassword(
                                email: idInput, 
                                password: pwdInput
                                );
                              } catch(e){
                                print(e);
                              }
                          }
                        )
                      )
                    ],
                  ),
                ),
              ),
            ),

            // 구글 로그인 버튼
            OutlinedButton.icon(
              onPressed: signInWithGoogle,
              style: OutlinedButton.styleFrom(
                backgroundColor: Colors.white,
                primary: Colors.black,
                side: BorderSide(
                  color: Colors.black
                ),
              ),
              // child: Text("Start with Google"),
              icon: Icon(Icons.login),
              label: Text("Start with Google"),
            )
          ],
        ),
      ),
    );
  }
}