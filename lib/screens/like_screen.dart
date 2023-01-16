import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hanpae/screens/detail.dart';
import 'package:like_button/like_button.dart';

class LikePage extends StatefulWidget {
  @override
  _LikePageState createState() => _LikePageState();
}

class _LikePageState extends State<LikePage> {
  get onLikeButtonTapped => null;

  // const LikePage({Key? key}) : super(key: key);

  Widget _like() {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection("Users")
          .doc(FirebaseAuth.instance.currentUser?.email)
          .collection("Like")
          .orderBy("timeStamp", descending: false)
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
              itemCount: snapshot.data!.docs.length,
              itemBuilder: ((context, index) => Container(
                    padding: const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
                    child: InkWell(
                        onTap: () => Get.to(() => DetailPage(
                            pageInfo: "test",
                            titleStr: snapshot.data!.docs[index]['title'],
                            explainStr: snapshot.data!.docs[index]['explain'],
                            keyValue: snapshot.data!.docs[index]['key'],
                            heart: snapshot.data!.docs[index]['like'],
                            
                            )),
                            
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(snapshot.data!.docs[index]['title'],
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 17,
                                    )),
                                // Text(snapshot.data!.docs[index]['authorName'],
                                //     style: TextStyle(
                                //       color: Colors.black,
                                //       fontSize: 10,
                                //     )),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 12.0, bottom: 15),
                                  child: LikeButton(
                                    onTap: onLikeButtonTapped,
                                  ),
                                ),
                              ],
                            ),
                            const Divider(color: Colors.black),
                          ],
                        )),
                  )),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: _like(),
    ));
  }
}
