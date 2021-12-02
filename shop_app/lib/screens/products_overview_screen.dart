// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/products_grid.dart';
import '../widgets/badge.dart';
import '../providers/cart.dart';
import './cart_screen.dart';
import '../providers/products.dart';

enum FilterOptions {
  Favorites,
  All,
}

class ProductsOverviewScreen extends StatefulWidget {
  bool showOnlyFavorites;
  String showCategory;
  static const routeName = '/product-overview';
  ProductsOverviewScreen(this.showOnlyFavorites, this.showCategory);

  @override
  _ProductsOverviewScreenState createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  var _isInit = true;
  var _isLoading = false;
  String showCat = '';

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<Products>(context).fetchAndSetProducts().then((_) {
        setState(() {
          _isLoading = false;
        });
      });
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      showCat = widget.showCategory;
    });
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(245, 246, 247, 1),
        foregroundColor: Colors.black,
        title: widget.showOnlyFavorites
            ? Padding(
                padding: const EdgeInsets.only(left: 130),
                child: Text(
                  'Favorites',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            : Padding(
                padding: const EdgeInsets.only(left: 145),
                child: Text(
                  'Home',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
        actions: <Widget>[
          Consumer<Cart>(
            builder: (_, cart, ch) => Badge(
              child: ch,
              value: cart.itemCartCount.toString(),
            ),
            child: IconButton(
              icon: Icon(
                Icons.shopping_cart,
              ),
              onPressed: () {
                Navigator.of(context).pushNamed(CartScreen.routeName);
              },
            ),
          ),
        ],
      ),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                    maxHeight: MediaQuery.of(context).size.height),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Container(
                        height: 200,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                            image: AssetImage("assets/images/promotion.png"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    widget.showOnlyFavorites == false
                        ? Container(
                            margin: EdgeInsets.only(left: 20),
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Categories',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                        : SizedBox(),
                    widget.showOnlyFavorites == false
                        ? Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: <Widget>[
                                  Card(
                                    elevation: 8,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: SizedBox(
                                        width: 150,
                                        height: 200,
                                        child: Column(
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  widget.showCategory = '';
                                                });
                                                print(widget.showCategory);
                                              },
                                              child: Container(
                                                height: 150,
                                                child: FadeInImage(
                                                  placeholder: AssetImage(
                                                      'assets/images/product-placeholder.png'),
                                                  image: NetworkImage(
                                                      'https://agrocommdistributors.com/wp-content/uploads/2021/04/247-2474633_transparent-electronics-items-png-png-download.png'),
                                                  fit: BoxFit.contain,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 8.0),
                                              child: Text(
                                                'All Items',
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Card(
                                    elevation: 8,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: SizedBox(
                                        width: 150,
                                        height: 200,
                                        child: Column(
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  widget.showCategory =
                                                      'Smartphones';
                                                });
                                                print(widget.showCategory);
                                              },
                                              child: Container(
                                                height: 150,
                                                child: FadeInImage(
                                                  placeholder: AssetImage(
                                                      'assets/images/product-placeholder.png'),
                                                  image: NetworkImage(
                                                      'https://images.samsung.com/pk/smartphones/galaxy-s21/buy/s21_family_kv_mo_img.jpg'),
                                                  fit: BoxFit.contain,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 8.0),
                                              child: Text(
                                                'Smart Phones',
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Card(
                                    elevation: 8,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: SizedBox(
                                        width: 150,
                                        height: 200,
                                        child: Column(
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  widget.showCategory =
                                                      'Tablets';
                                                });
                                                print(widget.showCategory);
                                              },
                                              child: Container(
                                                height: 150,
                                                child: FadeInImage(
                                                  placeholder: AssetImage(
                                                      'assets/images/product-placeholder.png'),
                                                  image: NetworkImage(
                                                      'https://cdn.vodafone.co.uk/en/assets/images/desktop/Apple_iPad_10_2_9th_gen__space_grey-full-product-front-600.png'),
                                                  fit: BoxFit.contain,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 8.0),
                                              child: Text(
                                                'Tablets',
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Card(
                                    elevation: 8,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: SizedBox(
                                        width: 150,
                                        height: 200,
                                        child: Column(
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  widget.showCategory =
                                                      'Laptops';
                                                });
                                                print(widget.showCategory);
                                              },
                                              child: Container(
                                                height: 150,
                                                child: FadeInImage(
                                                  placeholder: AssetImage(
                                                      'assets/images/product-placeholder.png'),
                                                  image: NetworkImage(
                                                      'https://m.media-amazon.com/images/I/81Ne5qKmE8L._SL1500_.jpg'),
                                                  fit: BoxFit.contain,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 8.0),
                                              child: Text(
                                                'Laptops',
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Card(
                                    elevation: 8,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: SizedBox(
                                        width: 150,
                                        height: 200,
                                        child: Column(
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  widget.showCategory =
                                                      'Headphones';
                                                });
                                                print(widget.showCategory);
                                              },
                                              child: Container(
                                                height: 150,
                                                child: FadeInImage(
                                                  placeholder: AssetImage(
                                                      'assets/images/product-placeholder.png'),
                                                  image: NetworkImage(
                                                      'https://www.stereo.com.sg/pub/media/catalog/product/cache/5fc3014ed970f95b2ceaf2a9ddc3aa5f/w/h/wh-1000xm4_b_stadard1-large_2nd.jpg'),
                                                  fit: BoxFit.contain,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 8.0),
                                              child: Text(
                                                'Headphones',
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        : SizedBox(),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 20),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        widget.showOnlyFavorites
                            ? 'Your Favorites'
                            : 'All Items',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    ProductsGrid(widget.showOnlyFavorites, widget.showCategory),
                  ],
                ),
              ),
            ),
    );
  }
}
