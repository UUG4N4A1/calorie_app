import 'package:calorie_app/data/calories_data.dart';
import 'package:flutter/material.dart';

class HomePageContent extends StatelessWidget {
  final List<int> lastWeekCalories = [
    2200,
    1800,
    2000,
    2500,
    2300,
    1900,
    2100,
  ];

  final int todayCalories = 2000;

  @override
  Widget build(BuildContext context) {
    double averageCalories = CaloriesData.calculateAverage(lastWeekCalories);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(height: 20),
        Text(
          "Last Week's Calories",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Text(
                  "Today's Calories",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(
                  "$todayCalories kcal",
                  style: TextStyle(fontSize: 20, color: Colors.green),
                ),
              ],
            ),
            Column(
              children: [
                Text(
                  "Last Week Avg",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(
                  "${averageCalories.toStringAsFixed(1)} kcal",
                  style: TextStyle(fontSize: 20, color: Colors.green),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
