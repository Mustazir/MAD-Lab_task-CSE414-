# Food Delivery App (Flutter)

A simple food delivery app UI built with **Flutter** that displays food items, allows users to view details of selected food, and add items to a cart. The app uses a basic UI structure with interactive components such as buttons, lists, images, and navigation.

## Features

- **Home Screen**: Displays a list of food items with images, names, and prices.
- **Details Screen**: Displays detailed information about the selected food item, including a description and a price.
- **Snackbar**: Confirms adding an item to the cart when the "Add to Cart" button is pressed.
- **Navigation**: Users can navigate from the Home Screen to the Details Screen.
- **Floating Action Button**: A cart icon for additional interactions (cart functionality not yet implemented).
- **Basic Styling**: Includes colors, fonts, padding, and images for a visually appealing UI.

## Screenshots

### Home Screen

![Home Screen](assets/screenshots/home_screen.png)

### Details Screen

![Details Screen](assets/screenshots/details_screen.png)

## Requirements

- **Flutter**: Ensure you have Flutter installed on your machine.
- **Dart**: Flutter apps are written in Dart, so make sure you have the Dart SDK set up correctly.

## Setup

1. Clone this repository to your local machine:

    ```bash
    git clone https://github.com/yourusername/food-delivery-app.git
    ```

2. Navigate to the project directory:

    ```bash
    cd food-delivery-app
    ```

3. Get the dependencies:

    ```bash
    flutter pub get
    ```

4. Run the app:

    ```bash
    flutter run
    ```

## Project Structure

- `lib/`
  - `main.dart`: The entry point of the app, where the app starts.
  - `models/food_item.dart`: The model class for food items.
  - `screens/home_screen.dart`: Home screen UI displaying the list of food items.
  - `screens/details_screen.dart`: Details screen UI displaying food item details.
- `assets/`
  - Contains food images (e.g., `food1.jpg`, `food2.jpg`) and screenshots for documentation.


