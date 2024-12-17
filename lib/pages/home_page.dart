import 'package:calorie_app/components/my_navigation.dart';
import 'package:calorie_app/pages/add_food_page.dart';
import 'package:calorie_app/pages/home_page_content.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  // Function to handle navigation item tap
  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calorie Tracker'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: _body(_currentIndex),
      ),
      bottomNavigationBar: MyNavigation(
        currentIndex: _currentIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }

  // Define the body content method
  Widget _body(int index) {
    switch (index) {
      case 0:
        return HomePageContent();
      case 1:
        return AddFoodPage();
      case 2:
        return Center(child: Text('Profile Page'));
      default:
        return Container();
    }
  }
}
