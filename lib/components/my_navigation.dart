import 'package:flutter/material.dart';
// custom navigation bar
class MyNavigation extends StatelessWidget {
  final int currentIndex;
  final Function(int) onItemTapped;

  MyNavigation({required this.currentIndex, required this.onItemTapped});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onItemTapped,
      items: const [
        BottomNavigationBarItem(label: 'Home', icon: Icon(Icons.home)),
        BottomNavigationBarItem(label: 'Add', icon: Icon(Icons.add)),
        BottomNavigationBarItem(label: 'Profile', icon: Icon(Icons.person)),
      ],
    );
  }
}
