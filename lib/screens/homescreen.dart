import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hanpae/screens/createpostpage.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  Widget _home() {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0, left: 8.0, right: 8.0, bottom: 5.0),
      child: StreamBuilder<QuerySnapshot> (
        // stream: FirebaseFirestore.instance.collectionGroup('Posts').orderBy('timeStamp', descending: true).snapshots(),
        stream: FirebaseFirestore.instance.collectionGroup('Posts').snapshots(),
        builder:(context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          }
          return Container(
            height: 500,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
            ),
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: ((context, index) => Container(
                padding: EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      snapshot.data!.docs[index]['title'],
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      snapshot.data!.docs[index]['authorName'],
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 10,
                      )
                    ),
                    Divider(color: Colors.black),
                  ],
                )
              )
            ),
            )
          );
        }
      ),
    );
  }

  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            _home(),
            // _home(),
          ],  
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.to(CreatePostPage()),
        child: Icon(Icons.add),
        backgroundColor: Colors.yellowAccent,
        elevation: 3,
      ),
    );
  }
}