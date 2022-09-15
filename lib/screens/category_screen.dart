import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hanpae/screens/board_screen.dart';
import 'package:hanpae/screens/createpostpage.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {

  Widget _categoryButton(String text, String printStr, String imgpath, String pathname){
    return InkWell(
      onTap: (){
        print(printStr);
        Get.to(() => BoardScreen(pageInfo: text));
      },
      child: Container(
        padding: const EdgeInsets.only(
          left: 10,
          right: 10,
          top: 20,
          bottom: 10,
        ),
        child: Column(
          children: [
            Image.asset(
              imgpath,
              width: 120,
              height: 120,
            ),
            Text(text),
          ],
        )
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      childAspectRatio: 1,
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      children: <Widget>[
        _categoryButton("동아리|학회", "동아리 버튼이 눌렸습니다.", "assets/image/club.png", "Club"),
        _categoryButton("공연정보", "공연정보 버튼이 눌렸습니다.", "assets/image/show.png", "Show"),
        _categoryButton("설문조사", "설문조사 버튼이 눌렸습니다.", "assets/image/survey.png", "Survey"),
        _categoryButton("강연|설명회", "강연 버튼이 눌렸습니다.", "assets/image/lecture.png", "Lecture"),
        _categoryButton("대회정보", "대회정보 버튼이 눌렸습니다.", "assets/image/contest.png", "Contest"),
        _categoryButton("기타", "기타 버튼이 눌렸습니다.", "assets/image/guitar.png", "Etc"),
      ]
    );
  }
}