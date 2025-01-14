import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import '../models/product.dart';

class ProductsProvider with ChangeNotifier {
  List<Product> _products = [];
  bool _showOnlyFavorites = false;
  final Box _box = Hive.box('groceries');

  List<Product> get products {
    if (_showOnlyFavorites) {
      return _products.where((product) => product.isFavorite).toList();
    }
    return [..._products];
  }

  List<Product> get favoriteProducts {
    return _products.where((product) => product.isFavorite).toList();
  }

  bool get showOnlyFavorites => _showOnlyFavorites;

  void initProducts() {
    final productsData = _box.get('products_list');
    
    if (productsData == null) {
      _products = [
        Product(id: '1', name: 'Sprite', price: 3.25),
        Product(id: '2', name: 'Ramen', price: 2.50),
        Product(id: '3', name: 'Tomatoes', price: 4.90),
        Product(id: '4', name: 'Cheese', price: 9.10),
      ];
      _saveProducts();
    } else {
      _products = (productsData as List).map((item) {
        return Product.fromMap(Map<String, dynamic>.from(item));
      }).toList();
    }
    notifyListeners();
  }

  void _saveProducts() {
    final productsData = _products.map((product) => product.toMap()).toList();
    _box.put('products_list', productsData);
  }

  void toggleShowOnlyFavorites() {
    _showOnlyFavorites = !_showOnlyFavorites;
    notifyListeners();
  }

  void toggleFavorite(String productId) {
    final productIndex = _products.indexWhere((prod) => prod.id == productId);
    if (productIndex >= 0) {
      _products[productIndex].isFavorite = !_products[productIndex].isFavorite;
      _saveProducts();
      notifyListeners();
    }
  }
}