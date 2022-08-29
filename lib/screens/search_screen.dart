import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  Widget _searchHistory() {
    return ListView(
      children:
        List.generate(
          10,
          (index) => ListTile(
          leading: Icon(Icons.access_time),
          title: Padding(
            padding: const EdgeInsets.only(bottom: 5.0),
            child: Text("예시입니다$index"),
          ),
          trailing: Icon(Icons.arrow_forward_ios, size: 15),
        ),
      ).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen,
        leading: IconButton(
          icon: new Icon(Icons.arrow_back),
          onPressed: Get.back,
        ),
        title: TextField(
          decoration: InputDecoration(
            fillColor: Colors.white.withOpacity(0.4),
            filled: true,
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ),
      body: _searchHistory(),
    );
  }
}