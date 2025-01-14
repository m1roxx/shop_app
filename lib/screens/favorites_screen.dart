import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/products_provider.dart';
import '../widgets/product_item.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'),
      ),
      body: Consumer<ProductsProvider>(
        builder: (ctx, productsData, _) => ListView.builder(
          itemCount: productsData.favoriteProducts.length,
          itemBuilder: (ctx, i) => ProductItem(
            product: productsData.favoriteProducts[i],
          ),
        ),
      ),
    );
  }
}
