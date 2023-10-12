import 'package:flutter/material.dart';
import 'package:my_flutter_app3/globalvar.dart';
import 'package:my_flutter_app3/product_details.dart';
import 'package:my_flutter_app3/products.dart';

class ProductList22 extends StatefulWidget {
  const ProductList22({super.key});

  @override
  State<ProductList22> createState() => _ProductList22State();
}

class _ProductList22State extends State<ProductList22> {
  late String selectedFilter;
  final List<String> filters = [
    'All',
    'Nike',
    'Adidas',
    'Puma',
    'Columbus',
  ];

  @override
  void initState() {
    super.initState();
    selectedFilter = filters[0];
  }

  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(
        // in -pace of this we can use layout builder . which is better than media query.
        context); // to get the device height and width // listning to one property size of screen
    const border1 = OutlineInputBorder(
      borderSide: BorderSide(
        color: Color.fromRGBO(199, 224, 217, 1),
      ),
      borderRadius: BorderRadius.horizontal(
        left: Radius.circular(40),
      ),
    );

    const border2 = OutlineInputBorder(
      borderSide: BorderSide(
        width: 1.5,
      ),
      borderRadius: BorderRadius.horizontal(
        left: Radius.circular(40),
        right: Radius.circular(40),
      ),
    );

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    'Shoes\nCollection',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      border: border1,
                      enabledBorder: border1,
                      focusedBorder: border2,
                      prefixIcon: Icon(
                        Icons.search,
                        size: 30,
                      ),
                      hintText: 'search',
                      hintStyle: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 60,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: filters.length,
                itemBuilder: (context, index) {
                  final filter = filters[index];
                  return Padding(
                    padding: EdgeInsets.only(
                      left: 5,
                      right: 5,
                    ),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedFilter = filter;
                        });
                      },
                      child: Chip(
                          backgroundColor: selectedFilter == filter
                              ? Theme.of(context).colorScheme.primary
                              : Color.fromRGBO(245, 247, 249, 1),
                          side: BorderSide(
                            color: Color.fromARGB(255, 236, 238, 240),
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          label: Text(
                            filter,
                            style: TextStyle(
                              fontSize: selectedFilter == filter ? 18 : 18,
                              fontWeight: selectedFilter == filter
                                  ? FontWeight.bold
                                  : FontWeight.w400,
                            ),
                          )),
                    ),
                  );
                },
              ),
            ),
            Expanded(
              child: size.width >= 1208
                  ? GridView.builder(
                      itemCount: products.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              childAspectRatio: 2, crossAxisCount: 2),
                      itemBuilder: (context, index) {
                        final product = products[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              // pushReplacement lga dete to ye ye back krne ka option nhi aata
                              MaterialPageRoute(
                                builder: (context) {
                                  return ProductDetails1(product: product);
                                },
                              ),
                            );
                          },
                          child: Product123(
                              title: product['title'] as String,
                              price: product['price'] as double,
                              image: product['imageUrl'] as String,
                              backgroundC: index.isEven
                                  ? Color.fromRGBO(216, 240, 253, 1)
                                  : Colors.white),
                        );
                      },
                    )
                  : ListView.builder(
                      itemCount: products.length,
                      itemBuilder: (context, index) {
                        final product = products[
                            index]; // here taking acces inside the products
                        return GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              // pushReplacement lga dete to ye ye back krne ka option nhi aata
                              MaterialPageRoute(
                                builder: (context) {
                                  return ProductDetails1(product: product);
                                },
                              ),
                            );
                          },
                          child: Product123(
                              title: product['title'] as String,
                              price: product['price'] as double,
                              image: product['imageUrl'] as String,
                              backgroundC: index.isEven
                                  ? Color.fromRGBO(216, 240, 253, 1)
                                  : Colors.white),
                        );
                      },
                    ),
            )
          ],
        ),
      ),
    );
  }
}
