# Calorie Tracker App

## Overview

The **Calorie Tracker App** is a Flutter-based mobile application designed to help users monitor their daily calorie intake and maintain a balanced diet. Users can search for food items, track their nutritional content (calories, protein, carbs, fat).

## Features

1.  **Track Calories**
    
    -   Add food items and view their nutritional breakdown.
        
    -   Automatically fetch data for food items using the Nutritionix API.
        
2.  **Daily Calorie Summary**
    
    -   View total calories, protein, carbs, and fat consumed for the day.
        
4.  **Search History**
    
    -   Quickly see recently searched food items.
        
5.  **Profile Management**
    
    -   Personalize the app with a user email.
        
6.  **Save Data**
    
    -   Save daily calorie consumption manually to ensure no data is lost.
        

## Technical Stack

-   **Flutter**: Cross-platform framework for building mobile applications.
    
-   **Nutritionix API**: Provides nutritional data for food items.
    
-   **Dart**: Programming language used for Flutter development.
    

## Installation

1.  **Clone the repository:**
    
    ```
    git clone <repository-url>
    ```
    
2.  **Navigate to the project directory:**
    
    ```
    cd calorie_tracker
    ```
    
3.  **Install dependencies:**
    
    ```
    flutter pub get
    ```
    
4.  **Run the application:**
    
    ```
    flutter run
    ```
    

## How It Works

1.  **Home Page**
    
    -   Displays a navigation bar to switch between pages (Home, Add Food, and Profile).
        
    -   Shows the current day's calorie and nutrient breakdown.
        
2.  **Add Food Page**
    
    -   Search for food items using the Nutritionix API.
        
    -   View nutritional details of searched items.
        
    -   Add food to the daily tracker.
        
3.  **Profile Page**
    
    -   Displays user email.
        

## API Integration

The app uses the Nutritionix API to fetch food data:

-   **Endpoint:**  `https://trackapi.nutritionix.com/v2/natural/nutrients`
    
-   **Headers:**
    
    -   `Content-Type: application/json`
        
    -   `x-app-id: <APP_ID>`
        
    -   `x-app-key: <API_KEY>`
        
-   **Request Payload:**
    
    ```
    {
      "query": "food item name"
    }
    ```
    
-   **Response:**
    
    -   Contains nutritional information including calories, protein, carbs, and fat.
        

## Code Structure

-   `**HomePage**`: Main navigation and daily summary.
    
-   `**AddFoodPage**`: Handles food search and addition.
    
-   `**ProfilePage**`: Displays user profile information.
    

## Upcoming Features

-   Persistent storage for calorie history.
    
-   Improved UI/UX for calorie breakdown visualization.
    
-   Support for custom food items.
    
-   Daily calorie goal tracking.

## Using Video
You can watch a tutorial on how to use the Calorie Tracker App here: [Watch the Video](<https://youtube.com/shorts/8ZXruAQG-kI>)
