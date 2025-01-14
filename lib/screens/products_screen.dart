import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/products_provider.dart';
import '../widgets/product_item.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () {
              Provider.of<ProductsProvider>(context, listen: false)
                  .toggleShowOnlyFavorites();
            },
          ),
          IconButton(
            icon: const Icon(Icons.favorite),
            onPressed: () {
              Navigator.pushNamed(context, '/favorites');
            },
          ),
        ],
      ),
      body: Consumer<ProductsProvider>(
        builder: (ctx, productsData, _) => ListView.builder(
          itemCount: productsData.products.length,
          itemBuilder: (ctx, i) => ProductItem(
            product: productsData.products[i],
          ),
        ),
      ),
    );
  }
}