import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hanpae/screens/category_screen.dart';
import 'package:hanpae/screens/homescreen.dart';
import 'package:hanpae/screens/like_screen.dart';
import 'package:hanpae/screens/notification_screen.dart';
import 'package:hanpae/widget/drawer.dart';

import '../screens/search_screen.dart';

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  final List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    const CategoryScreen(),
    const LikePage(),
    NotificationPage(),
    
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _bottom() {
    return BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.lightGreen,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Category',
            backgroundColor: Colors.lightGreen,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Like',
            backgroundColor: Colors.lightGreen,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
            backgroundColor: Colors.lightGreen,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color.fromARGB(255, 255, 245, 105),
        onTap: _onItemTapped,
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hanpae'),
        backgroundColor: Colors.lightGreen,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              onPressed: () => Get.to(SearchPage()),
              icon: Icon(Icons.search)
              ),
          )
        ],
      ),
      // backgroundColor: Colors.green,
      drawer: myDrawer(),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: _bottom(),
    );
  }
}

