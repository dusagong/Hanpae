import 'package:flutter/material.dart';
import 'package:hanpae/main.dart';
import 'package:like_button/like_button.dart';

class LikePage extends StatelessWidget {
  const LikePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _textList(String contentStr) {
      return Padding(
        padding: const EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(contentStr,
                    style: TextStyle(
                      fontSize: 20,
                    ),
                    overflow: TextOverflow.ellipsis),
                Icon(
                  Icons.favorite,
                  color: Colors.red,
                  // onTap: onLikeButtonTapped,
                ),
              ],
            ),
            Divider(
              color: Colors.black,
            )
          ],
        ),
      );
    }

    return ListView(
      children: [
        _textList('2022 전산동아리 SLE 리크루팅'),
        _textList('한동언어학회 리크루팅'),
        _textList('[오르 동아리] 2학기 오르 리크루팅'),
        _textList('22-1 천풍해세 자체 공연'),
        _textList('!!피치파이프 공연 온라인 티켓 예매!!'),
        _textList('오늘 판매마감, 우리 서울에서 연극볼래?'),
      ],
    );
  }
}
