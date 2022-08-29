// import 'package:flutter/material.dart';

// class BottomBar extends StatelessWidget {
//   int index;
//   BottomBar({Key? key, this.index = 0}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return BottomNavigationBar(
//       items: const <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: 'Home',
//             backgroundColor: Colors.lightGreen,
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.category),
//             label: 'Category',
//             backgroundColor: Colors.lightGreen,
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.favorite),
//             label: 'Like',
//             backgroundColor: Colors.lightGreen,
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.settings),
//             label: 'Settings',
//             backgroundColor: Colors.lightGreen,
//           ),
//         ],
//         currentIndex: index,
//         selectedItemColor: Color.fromARGB(255, 255, 245, 105),
//         onTap: _onItemTapped,
//     );
//   }
// }