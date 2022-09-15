import 'package:flutter/material.dart';

class PostCard extends StatefulWidget{
  int number;

  PostCard({required this.number});

  @override
  _PostCardState createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 30,
          width: MediaQuery.of(context).size.width,
          color: Colors.grey,
          child: Center(child: Text('title')),
        ),
        Container(
          child: Text('story'),
        ),
      ],
    );
  }
}



