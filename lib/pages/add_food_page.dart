import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class AddFoodPage extends StatefulWidget {
  final Function(int, double, double, double) onFoodAdded;

  AddFoodPage({required this.onFoodAdded});

  @override
  _AddFoodPageState createState() => _AddFoodPageState();
}

class _AddFoodPageState extends State<AddFoodPage> {
  final TextEditingController _foodController = TextEditingController();
  Map<String, dynamic>? _foodData;
  bool _isLoading = false;
//nutritionix key
  List<String> _searchHistory = []; 
  String _appId = 'e9073517';
  String _apiKey = '2b6b43934c7b31c624b0f37bdd9cf11f';

  Future<void> fetchFoodData(String foodName) async {
    setState(() {
      _isLoading = true;
      _foodData = null; 
    });
    final url =
        Uri.parse('https://trackapi.nutritionix.com/v2/natural/nutrients');
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        'x-app-id': _appId,
        'x-app-key': _apiKey,
      },
      body: json.encode({'query': foodName}),
    );

    setState(() {
      _isLoading = false;
    });

    if (response.statusCode == 200) {
      setState(() {
        _foodData = json.decode(response.body);

        if (!_searchHistory.contains(foodName)) {
          _searchHistory.insert(0, foodName); 
          if (_searchHistory.length > 5) {
            _searchHistory.removeLast(); 
          }
        }
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: Unable to fetch food data')),
      );
    }
  }

  void _handleHistoryItemTap(String foodName) {
    _foodController.text = foodName; 
    fetchFoodData(foodName); 
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Input Section
            TextField(
              controller: _foodController,
              decoration: InputDecoration(
                labelText: 'Enter food item',
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: () {
                    _foodController.clear();
                  },
                ),
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
            SizedBox(height: 10),

            // omnoh hailtuud
            if (_searchHistory.isNotEmpty)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Search History",
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Container(
                    height: 100,
                    child: ListView.builder(
                      itemCount: _searchHistory.length,
                      itemBuilder: (context, index) {
                        final item = _searchHistory[index];
                        return ListTile(
                          title: Text(item),
                          leading: Icon(Icons.history, color: Colors.blue),
                          onTap: () {
                            _handleHistoryItemTap(item);
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),

            // hailtiin ilertsuud
            SizedBox(height: 10),
            if (_isLoading) Center(child: CircularProgressIndicator()),
            if (_foodData != null)
              Expanded(
                child: ListView.builder(
                  itemCount: _foodData!['foods']?.length ?? 0,
                  itemBuilder: (context, index) {
                    final food = _foodData!['foods'][index];
                    return Card(
                      elevation: 4,
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      child: ListTile(
                        leading: Icon(Icons.fastfood, color: Colors.orange),
                        title: Text(food['food_name'],
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        subtitle: Text(
                          'Calories: ${food['nf_calories']} kcal\n'
                          'Protein: ${food['nf_protein']} g\n'
                          'Carbs: ${food['nf_total_carbohydrate']} g\n'
                          'Fat: ${food['nf_total_fat']} g',
                        ),
                        trailing: ElevatedButton(
                          onPressed: () {
                            widget.onFoodAdded(
                              food['nf_calories'].round(),
                              food['nf_protein'],
                              food['nf_total_carbohydrate'],
                              food['nf_total_fat'],
                            );
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                  content: Text(
                                      '${food['food_name']} added successfully!')),
                            );
                          },
                          child: Text('Add'),
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(horizontal: 16),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            if (!_isLoading && _foodData == null)
              Center(
                  child: Text('Search for a food item to see its nutrition!')),
          ],
        ),
      ),
    );
  }
}
