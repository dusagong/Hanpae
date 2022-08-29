import 'package:flutter/material.dart';

class Post{ 
  String? key;
  String? title;
  String? explain;
  String? firstPicUrl;
  int? firstPicWidth;
  int? firstPicHeight;
  String? authorName;
  int? like;


  Post({
    @required this.key,
    this.title,
    this.explain,
    this.firstPicUrl,
    this.firstPicWidth,
    this.firstPicHeight,
    this.authorName,
    this.like
  });
}