import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class myDrawer extends StatelessWidget {
  const myDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            currentAccountPicture: CircleAvatar(
              //사용자 계정 이미지
              backgroundImage: AssetImage('assets/image/profile_.tiff'),
              backgroundColor: Colors.white,
            ),
            accountName: Text(FirebaseAuth.instance.currentUser!.displayName.toString()),
            accountEmail: Text(FirebaseAuth.instance.currentUser!.email.toString()),
            // onDetailsPressed: () {
            //   print('arrow is clicked');
            // },//쪼꼬미 화살표
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 6, 15, 82),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30.0),
                    bottomRight: Radius.circular(30.0))),
          ),
          ListTile(
            leading: const Icon(Icons.edit),
            title: const Text('내가 쓴 글 관리'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.notifications_active),
            title: const Text('알림 설정'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.lock),
            title: const Text('비밀번호 설정'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          const Divider(
            color: Color.fromARGB(255, 6, 15, 82),
          ),
          // ListTile(
          //   leading: const Icon(Icons.logout),
          //   title: const Text('로그아웃'),
          //   onTap: () {
          //     FirebaseAuth.instance.signOut;
          //     // FirebaseAuth.instance.signOut;
          //     // Navigator.pop(context);
          //   },
          // ),
          TextButton(
            onPressed: FirebaseAuth.instance.signOut,
            style: TextButton.styleFrom(
              backgroundColor: Colors.white,
              primary: Color.fromARGB(255, 27, 26, 26),
            ),
            child: const Text("로그아웃"),
          ),
        ],
      ),
      //   ),
      // ),
    );
  }
}