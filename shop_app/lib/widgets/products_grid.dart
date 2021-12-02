import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/products.dart';
import './product_item.dart';

class ProductsGrid extends StatelessWidget {
  final bool showFavs;
  final String showCat;
  ProductsGrid(this.showFavs, this.showCat);

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    final products = showFavs
        ? productsData.favoriteItems
        : showCat == 'Smartphones'
            ? productsData.smartphones
            : showCat == 'Laptops'
                ? productsData.laptops
                : showCat == 'Tablets'
                    ? productsData.tablets
                    : showCat == 'Headphones'
                        ? productsData.headphones
                        : productsData.items;
    return Expanded(
      child: GridView.builder(
        padding: const EdgeInsets.all(10.0),
        itemCount: products.length,
        itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
          value: products[i],
          child: ProductItem(),
        ),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 55 / 100,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
      ),
    );
  }
}
