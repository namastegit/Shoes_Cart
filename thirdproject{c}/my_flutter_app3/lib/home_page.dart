import 'package:flutter/material.dart';
import 'package:my_flutter_app3/globalvar.dart';
import 'package:my_flutter_app3/productList.dart';
import 'package:my_flutter_app3/product_details.dart';
import 'package:my_flutter_app3/products.dart';
import 'package:my_flutter_app3/cartPage.dart';

class HomePage1 extends StatefulWidget {
  const HomePage1({super.key});

  @override
  State<HomePage1> createState() => _HomePage1State();
}

class _HomePage1State extends State<HomePage1> {
  int currentPage = 0;
  // List<Widget> pages = [ProductList22(), CartPage()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: IndexedStack(
          index: currentPage,
          children: [
            ProductList22(),
            CartPage()
          ], // ya yha pages pass kr skte hai jo list pages ki bnaii hai.
        ),
        // body: currentPage == 0 ? ProductList22() : CartPage(),
        //body:pages[currentPage], -- will work as above line
//pages[0] -- to list me 0th index acces krega ye ProductList22
/*----------------------BOTTOM NAVIGATION BAR -------------------------------------------------------------------------------------*/
        bottomNavigationBar: BottomNavigationBar(
            selectedFontSize: 0,
            unselectedFontSize: 0, // niche ki padding km kr dega ye
            iconSize: 33,
            onTap: (value) {
              setState(() {
                currentPage = value;
              });
            },
            currentIndex: currentPage,
            items: const [
              BottomNavigationBarItem(
                label: '',
                icon: Icon(
                  Icons.home_filled,
                ),
              ),
              BottomNavigationBarItem(
                label: '',
                icon: Icon(Icons.shopping_cart),
              ),
            ]));
  }
}
