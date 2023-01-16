import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hanpae/screens/createpostpage.dart';
import 'package:hanpae/screens/detail.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // CollectionReference<Map<String, dynamic>> _collectionReference = FirebaseFirestore.instance.collection("Posts");
  // QuerySnapshot<Map<String, dynamic>> querySanpshot = _collectionReference.orderBy("timeStamp").get();
  Widget _home() {
    return Padding(
      padding:
          const EdgeInsets.only(top: 15.0, left: 8.0, right: 8.0, bottom: 5.0),
      child: StreamBuilder<QuerySnapshot>(
          // stream: FirebaseFirestore.instance.collectionGroup('Posts').orderBy('timeStamp', descending: true).snapshots(),
          stream: FirebaseFirestore.instance
              .collectionGroup('posts')
              .orderBy('timeStamp', descending: true)
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            }
            return Container(
                height: 400,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                ),

                child: Scrollbar(
                    child: ListView.builder(
                  itemCount: snapshot.data?.docs.length,
                  itemBuilder: ((context, index) => Container(
                      padding: const EdgeInsets.only(
                          top: 8.0, left: 8.0, right: 8.0),
                      child: InkWell(
                        onTap: () => Get.to(() => DetailPage(
                              pageInfo: "hanpae",
                              titleStr: snapshot.data!.docs[index]['title'],
                              explainStr: snapshot.data!.docs[index]['explain'],
                              imgURL: snapshot.data!.docs[index]['firstPicUrl'],
                              keyValue: snapshot.data!.docs[index]['key'],
                              heart: snapshot.data!.docs[index]['like'],

                            )),
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
                            Text(snapshot.data!.docs[index]['authorName'],
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 10,
                                )),
                            Divider(color: Colors.black),
                          ],
                        ),
                      ))),
                )));
          }),
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
        backgroundColor: Color.fromARGB(255, 128, 211, 255),
        elevation: 3,
      ),
    );
  }
}
