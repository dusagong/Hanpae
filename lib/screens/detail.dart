import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';

class DetailPage extends StatefulWidget {
  String pageInfo;
  String titleStr;
  String explainStr;
  String imgURL;
  DetailPage({Key? key, required this.pageInfo, required this.titleStr, required this.explainStr, this.imgURL = ''}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {

  Future<bool> onLikeButtonTapped(bool isLiked) async{
    return !isLiked;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.pageInfo),
      ),
      body: StreamBuilder<QuerySnapshot> (
      stream: FirebaseFirestore.instance.collection(widget.pageInfo).snapshots(),
        builder:(context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          }
          return SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 15.0, bottom: 10.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        widget.titleStr,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                // Divider(
                //   color: Colors.black,
                // ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
                  child: Container(
                    alignment: Alignment.topLeft,
                    child: Text(
                      widget.explainStr,
                      style: const TextStyle(
                        fontSize: 15,
                        height: 1.7
                      )
                    ),
                  ),
                ),
                Center(
                  child:((){
                    if(widget.imgURL != '') {
                      return  Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Image.network(
                        alignment: Alignment.topCenter,
                        widget.imgURL,
                        width: 300,
                        ),
                      );
                    }
                  })(),
                ),
                
                  // Padding(
                  //   padding: const EdgeInsets.only(top: 8.0),
                  //   child: Image.network(
                  //     alignment: Alignment.topCenter,
                  //     widget.imgURL,
                  //     width: 300,
                  //     ),
                  // ),
                // Divider(color: Colors.black),
                Padding(
                  padding: const EdgeInsets.only(top: 12.0, bottom: 15),
                  child: LikeButton(
                    onTap: onLikeButtonTapped,
                  ),
                ),
              ],
            ),
          );
        }
      )
    );
  }
}