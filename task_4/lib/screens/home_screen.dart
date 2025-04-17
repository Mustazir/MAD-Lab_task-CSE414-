import 'package:flutter/material.dart';
import 'details_screen.dart'; // Import the DetailsScreen

class HomeScreen extends StatelessWidget {
  final bool isGridView;
  final Function(String) addToCart;

  const HomeScreen({super.key, required this.isGridView, required this.addToCart});

  @override
  Widget build(BuildContext context) {
    final foodItems = [
    {'name': 'Pizza', 'price': 10.99, 'image': 'assets/pizza.jpg'},
    {'name': 'Burger', 'price': 5.99, 'image': 'assets/burger.jpg'},
    {'name': 'Pasta', 'price': 8.99, 'image': 'assets/pasta.jpg'},
    ];

    // Create a list of widgets (either ListView or GridView based on isGridView)
    Widget foodList = isGridView
        ? GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemCount: foodItems.length,
            itemBuilder: (context, index) {
              final foodItem = foodItems[index];
              return Padding(
                padding: const EdgeInsets.all(8.0), // Padding for better style
                child: Card(
                  elevation: 4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(foodItem['image']!),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          foodItem['name']!,
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('\$${foodItem['price']}'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // Navigate to the details screen
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailsScreen(foodItem: foodItem),
                            ),
                          );
                        },
                        child: Text("Details"),
                      ),
                    ],
                  ),
                ),
              );
            },
          )
        : ListView.builder(
            itemCount: foodItems.length,
            itemBuilder: (context, index) {
              final foodItem = foodItems[index];
              return Padding(
                padding: const EdgeInsets.all(8.0), // Padding for better style
                child: Card(
                  elevation: 4,
                  child: Row(
                    children: [
                      Image.asset(
                        foodItem['image']!,
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            foodItem['name']!,
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          Text('\$${foodItem['price']}'),
                        ],
                      ),
                      Spacer(),
                      ElevatedButton(
                        onPressed: () {
                          // Navigate to the details screen
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailsScreen(foodItem: foodItem),
                            ),
                          );
                        },
                        child: Text("Details"),
                      ),
                    ],
                  ),
                ),
              );
            },
          );

    return Scaffold(
      appBar: AppBar(
        title: Text('Food Delivery App'),
      ),
      body: foodList,
    );
  }
}
