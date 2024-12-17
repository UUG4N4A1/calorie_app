import 'package:calorie_app/components/my_navigation.dart';
import 'package:flutter/material.dart';
import 'add_food_page.dart';
import 'home_page_content.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  int totalCalories = 0;
  double totalProtein = 0.0;
  double totalCarbs = 0.0;
  double totalFat = 0.0;

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  void _addFoodData(int calories, double protein, double carbs, double fat) {
    setState(() {
      totalCalories += calories;
      totalProtein += protein;
      totalCarbs += carbs;
      totalFat += fat;
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

  Widget _body(int index) {
    switch (index) {
      case 0:
        return HomePageContent(
          totalCalories: totalCalories,
          totalProtein: totalProtein,
          totalCarbs: totalCarbs,
          totalFat: totalFat,
        );
      case 1:
        return AddFoodPage(onFoodAdded: _addFoodData);
      case 2:
        return Center(child: Text('Profile Page'));
      default:
        return Container();
    }
  }
}
