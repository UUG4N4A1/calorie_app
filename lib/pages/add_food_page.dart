import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class AddFoodPage extends StatefulWidget {
  @override
  _AddFoodPageState createState() => _AddFoodPageState();
}

class _AddFoodPageState extends State<AddFoodPage> {
  final TextEditingController _foodController = TextEditingController();
  Map<String, dynamic>? _foodData;
  String _appId = 'e9073517'; // Replace with your Nutritionix app ID
  String _apiKey = '2b6b43934c7b31c624b0f37bdd9cf11f'; // Replace with your Nutritionix API Key

  Future<void> fetchFoodData(String foodName) async {
    final url = Uri.parse('https://trackapi.nutritionix.com/v2/natural/nutrients');
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        'x-app-id': _appId,
        'x-app-key': _apiKey,
      },
      body: json.encode({
        'query': foodName,
      }),
    );

    if (response.statusCode == 200) {
      setState(() {
        _foodData = json.decode(response.body);
      });
    } else {
      setState(() {
        _foodData = null;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: Unable to fetch food data')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Food Item'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _foodController,
              decoration: InputDecoration(
                labelText: 'Enter food item',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                if (_foodController.text.isNotEmpty) {
                  fetchFoodData(_foodController.text);
                }
              },
              child: Text('Track Calories'),
            ),
            SizedBox(height: 20),
            if (_foodData != null)
              Expanded(
                child: ListView.builder(
                  itemCount: _foodData!['foods']?.length ?? 0,
                  itemBuilder: (context, index) {
                    final food = _foodData!['foods'][index];
                    return Card(
                      child: ListTile(
                        title: Text(food['food_name']),
                        subtitle: Text(
                          'Calories: ${food['nf_calories']} kcal\n'
                          'Protein: ${food['nf_protein']} g\n'
                          'Carbs: ${food['nf_total_carbohydrate']} g\n'
                          'Fat: ${food['nf_total_fat']} g',
                        ),
                      ),
                    );
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}
