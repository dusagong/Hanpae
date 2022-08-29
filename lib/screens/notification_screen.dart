import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    _textList(String contentStr) {
      return Padding(
        padding: const EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              contentStr,
              style: TextStyle(
                fontSize: 18,
              )
            ),
            Divider(color: Colors.black,)
          ],
        ),
      );
    }

    return ListView(
      children: [
        _textList('[D-Day] 내가 좋아요를 누른 게시글 중 마감 임박 게시글이 있습니다!'),
        _textList('누군가 내 게시글에 좋아요를 눌렀습니다.'),
        _textList('누군가 내 게시글에 좋아요를 눌렀습니다.'),
        _textList('[D-5] 내가 좋아요를 누른 게시글 중 마감 임박 게시글이 있습니다!'),
        _textList('게시글을 성공적으로 올렸습니다.'),
        _textList('누군가 내 게시글에 좋아요를 눌렀습니다.'),
      ],
    );
  }
}