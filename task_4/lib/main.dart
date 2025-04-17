import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/cart_screen.dart';
import 'screens/profile_screen.dart';

void main() {
  runApp(FoodApp());
}

class FoodApp extends StatefulWidget {
  const FoodApp({super.key});

  @override
  _FoodAppState createState() => _FoodAppState();
}

class _FoodAppState extends State<FoodApp> {
  int _selectedIndex = 0;
  bool _isGridView = true; // Default view is GridView
  final List<String> _cartItems = []; // To store cart items

  final List<Widget> _screens = [];

  @override
  void initState() {
    super.initState();
    _screens.addAll([
      // Initialize the HomeScreen and CartScreen here
      HomeScreen(isGridView: _isGridView, addToCart: _addToCart), // Default as GridView
      CartScreen(cartItems: _cartItems), // Pass cart items to CartScreen
      ProfileScreen(),
    ]);
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _toggleView() {
    setState(() {
      _isGridView = !_isGridView; // Toggle between List and Grid
    });
    // Update the HomeScreen when the view is toggled
    _screens[0] = HomeScreen(isGridView: _isGridView, addToCart: _addToCart);
  }

  // Method to add items to the cart
  void _addToCart(String foodItem) {
    setState(() {
      _cartItems.add(foodItem);
    });
    // Show snackbar when an item is added to cart
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('$foodItem added to cart')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food Delivery App',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Food Delivery App'),
          actions: [
            IconButton(
              icon: Icon(_isGridView ? Icons.view_list : Icons.grid_view),
              onPressed: _toggleView, // Toggle the view on press
            ),
          ],
        ),
        // Use the selected screen based on the index
        body: _screens[_selectedIndex], 
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: 'Cart',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              label: 'Profile',
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.shopping_cart),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
