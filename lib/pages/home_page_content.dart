import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class HomePageContent extends StatefulWidget {
  final int totalCalories;
  final double totalProtein;
  final double totalCarbs;
  final double totalFat;

  HomePageContent({
    required this.totalCalories,
    required this.totalProtein,
    required this.totalCarbs,
    required this.totalFat,
  });

  @override
  _HomePageContentState createState() => _HomePageContentState();
}

class _HomePageContentState extends State<HomePageContent> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(height: 20),
        Text(
          "Today's Consumption",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Text(
                  "Calories",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(
                  "${widget.totalCalories} kcal",
                  style: TextStyle(fontSize: 20, color: Colors.green),
                ),
              ],
            ),
            Column(
              children: [
                Text(
                  "Protein",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(
                  "${widget.totalProtein.toStringAsFixed(1)} g",
                  style: TextStyle(fontSize: 20, color: Colors.green),
                ),
              ],
            ),
            Column(
              children: [
                Text(
                  "Carbs",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(
                  "${widget.totalCarbs.toStringAsFixed(1)} g",
                  style: TextStyle(fontSize: 20, color: Colors.green),
                ),
              ],
            ),
            Column(
              children: [
                Text(
                  "Fat",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(
                  "${widget.totalFat.toStringAsFixed(1)} g",
                  style: TextStyle(fontSize: 20, color: Colors.green),
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: 30),
        Text(
          "Macronutrient Distribution",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 10),
        Expanded(
          child: PieChart(
            PieChartData(
              sections: _buildPieChartSections(),
              centerSpaceRadius: 50,
              borderData: FlBorderData(show: false),
              sectionsSpace: 2,
            ),
          ),
        ),
        // pie chart iin hayguud
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildLegend("Protein", Colors.blue),
            SizedBox(width: 20),
            _buildLegend("Carbs", Colors.orange),
            SizedBox(width: 20),
            _buildLegend("Fat", Colors.purple),
          ],
        ),
      ],
    );
  }

  // piechart gargaj ireh
  List<PieChartSectionData> _buildPieChartSections() {
    final double total =
        widget.totalProtein + widget.totalCarbs + widget.totalFat;

    if (total == 0) {
      // hooson baih uyiin baidal
      return [
        PieChartSectionData(
          value: 1,
          color: Colors.grey,
          title: "No Data",
          radius: 50,
          titleStyle: TextStyle(
              color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
        ),
      ];
    }

    return [
      PieChartSectionData(
        value: widget.totalProtein,
        color: Colors.blue,
        title: "${((widget.totalProtein / total) * 100).toStringAsFixed(1)}%",
        radius: 50,
        titleStyle: TextStyle(
            color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
      ),
      PieChartSectionData(
        value: widget.totalCarbs,
        color: Colors.orange,
        title: "${((widget.totalCarbs / total) * 100).toStringAsFixed(1)}%",
        radius: 50,
        titleStyle: TextStyle(
            color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
      ),
      PieChartSectionData(
        value: widget.totalFat,
        color: Colors.purple,
        title: "${((widget.totalFat / total) * 100).toStringAsFixed(1)}%",
        radius: 50,
        titleStyle: TextStyle(
            color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
      ),
    ];
  }

  Widget _buildLegend(String label, Color color) {
    return Row(
      children: [
        Container(
          width: 20,
          height: 20,
          color: color,
        ),
        const SizedBox(width: 8),
        Text(
          label,
          style: const TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}
