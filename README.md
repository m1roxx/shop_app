# Shop App

## Overview

This is a Flutter application that displays a list of products with their names and prices. Users can add products to their favorites and filter the list to display only their favorite items. The app uses `Provider` for state management and `Hive` for local storage.

---

## Features

1. **List of Products**  
   - Displays a list of predefined products with their names and prices using `ListView`.

2. **Favorites Management**  
   - Users can add or remove products from their favorites.
   - Favorite status is updated in real-time without screen reload.

3. **Filter Favorites**  
   - Provides a filter to display only favorite products.

4. **Navigation**  
   - Two screens:
     - **Screen 1:** List of all products.  
     - **Screen 2:** Favorites list.

5. **Local Storage**  
   - Products and their favorite statuses are stored locally using `Hive`.

---

## Technologies Used

- **Flutter**
- **Provider**: For state management.
- **Hive**: For local data storage.
- **Dart**: Primary programming language.

---
