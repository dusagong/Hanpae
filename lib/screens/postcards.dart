import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:hanpae/firebase_options.dart';
import 'package:hanpae/screens/postcards.dart';

import '../models/post.dart';

class PostCard extends StatefulWidget{
  int number;

  PostCard({required this.number});

  @override
  _PostCardState createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  // final FirebaseFirestore post = FirebaseFirestore.instance;

  // StreamSubscription<QuerySnapshot>? _postSubscription;
  // List<Post> _postMessage = [];
  // List<Post> get Posts => _postMessage;

  // Future<void> init() async {
  //   await Firebase.initializeApp(
  //     options: DefaultFirebaseOptions.currentPlatform,
  //   );
//   late List dataList;

//   Future<void> getData() async {
//     // Get docs from collection reference
//     QuerySnapshot querySnapshot = await post.collection('동아리|학회').get();

//     // Get data from docs and convert map to List
//     // final allData = querySnapshot.docs.map((doc) => doc.data()).toList();
//     List allData = querySnapshot.docs.map((doc) => doc.get('title')).toList();
//   //for a specific field
//     // final allData =
//     //       querySnapshot.docs.map((doc) => doc.get('fieldName')).toList();
//     print(allData);

//     if(dataList != null)
//       dataList = allData;
//     else
//       dataList = ['no data'];

//     print(dataList);
// }

// @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     dataList = [''];
//     getData();
//   }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 30,
          width: MediaQuery.of(context).size.width,
          color: Colors.grey,
          // getData()
          // child: Center(child: Text(post.collection('동아리|학회').get().toString()),),
          child: Text('title'),
          // QuerySnapshot querySnapshot = post.collection('동아리|학회').get();;

        ),
        Container(
          height: 100,
          child: Text('story'),
        ),
      ],
    );
  }
}



