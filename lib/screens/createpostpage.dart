import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:math';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:hanpae/providers/auth.dart';

class CreatePostPage extends StatefulWidget {
  @override
  _CreatePostPageState createState() => _CreatePostPageState();
}

class _CreatePostPageState extends State<CreatePostPage> {
  late bool titleUpload;
  late bool contentUpload;

  FirebaseFirestore fireStore = FirebaseFirestore.instance;

  TextEditingController titleController = TextEditingController();
  TextEditingController storyController = TextEditingController();

  String postTitle = "";
  String story = "";

  String _chars =
      'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  final Random _rnd = Random();

  String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
      length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));

  final _valueList = ['카테고리', '동아리|학회', '공연정보', '설문조사', '강연|설명회', '대회정보', '기타'];
  var _selectedValue = '카테고리';

  @override
  void initState() {
    titleUpload = false;
    contentUpload = false;
  }

  void showDatePickerPop() {
    Future<DateTime?> selectedDate = showDatePicker(
      context: context,
      initialDate: DateTime.now(), //초기값
      firstDate: DateTime(2022), //시작일
      lastDate: DateTime(2024), //마지막일
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.dark(), //다크 테마
          child: child!,
        );
      },
    );

    selectedDate.then((dateTime) {
      Fluttertoast.showToast(
        msg: dateTime.toString(),
        toastLength: Toast.LENGTH_LONG,
        //gravity: ToastGravity.CENTER,  //위치(default 는 아래)
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("posting"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: SingleChildScrollView(
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 23),
                  child: DropdownButton(
                    value: _selectedValue,
                    items: _valueList.map(
                      (value) {
                        return DropdownMenuItem(
                          value: value,
                          child: Text(value),
                        );
                      },
                    ).toList(),
                    onChanged: (value) {
                      setState(() {
                        if (value != null) _selectedValue = value as String;
                      });
                    },
                  ),
                ),  
                Padding(padding: const EdgeInsets.only(left: 23),
                  child: IconButton(
                  icon: Icon(Icons.date_range),
                  onPressed: () {
                    showDatePickerPop();
                  },
                  
                ),
                )
               
              ],
            ),
            TextField(
              controller: titleController,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.title),
                border: OutlineInputBorder(),
                labelText: '제목',
                // hintText: '제목',
              ),
              onChanged: (value) {
                setState(() {
                  postTitle = value;
                });
              },
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: TextField(
                controller: storyController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.content_paste_go),
                  labelText: '내용을 입력하세요',
                  // hintText: '내용을 입력하세요',
                ),
                maxLines: 20,
                onChanged: (value) {
                  setState(() {
                    story = value;
                  });
                },
              ),
            ),
            ElevatedButton(
                onPressed: _selectedValue == '카테고리' ||
                        story == "" ||
                        postTitle == ""
                    ? null
                    : () {
                        String postKey = getRandomString(16);
                        fireStore
                            .collection(_selectedValue)
                            .doc('Posts')
                            .collection('Posts')
                            .doc(postKey)
                            .set({
                          "key": postKey,
                          "title": postTitle,
                          "explain": story,
                          "firstPicUrl": "",
                          "firstPicWidth": 0,
                          "firstPicHeight": 0,
                          "authorName":
                              FirebaseAuth.instance.currentUser!.displayName,
                          "like": 0,
                          'timeStamp': DateTime.now(),
                        });
                        Get.back();
                        // FirebaseFirestore
                        // fireStore = FirebaseFirestore.instance;
                      },
                style: ElevatedButton.styleFrom(
                    onSurface: Color.fromARGB(255, 63, 141, 180)),
                child: Text("upload")),
          ]),
        ),
      ),
    );
  }
}
