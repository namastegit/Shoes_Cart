import 'package:flutter/material.dart';
import 'package:my_flutter_app3/cart_provider.dart';
import 'package:my_flutter_app3/globalvar.dart';
import 'package:provider/provider.dart';

class ProductDetails1 extends StatefulWidget {
  final Map<String, Object> product;
  const ProductDetails1({super.key, required this.product});

  @override
  State<ProductDetails1> createState() => _ProductDetails1State();
}

class _ProductDetails1State extends State<ProductDetails1> {
  int selectedSize = 0;
  void onTap() {
    if (selectedSize != 0) {
      Provider.of<CartProvider>(context, listen: false).addProduct({
        'id': widget.product['id'],
        'title': widget.product['title'],
        'price': widget.product['price'],
        'imageUrl': widget.product['imageUrl'],
        'company': widget.product['company'],
        'sizes': selectedSize,
      });
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Product added successfully')));
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Please select a size')));
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(
            left: 78,
          ),
          child: Text(
            'Details',
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
      ),
      body: Column(
        children: [
          Text(
            widget.product['title'] as String,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              widget.product['imageUrl'] as String,
              height: 300,
            ),
          ),
          const Spacer(
            flex: 2,
          ),
          Container(
            height: 230,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Color.fromRGBO(231, 234, 238, 1),
              borderRadius: BorderRadius.circular(40),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text('\$${widget.product['price']}',
                      style: Theme.of(context).textTheme.titleLarge),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 50,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: (widget.product['sizes'] as List<int>).length,
                      itemBuilder: (context, index) {
                        final size =
                            (widget.product['sizes'] as List<int>)[index];
                        return Container(
                          margin: EdgeInsets.symmetric(horizontal: 7),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedSize = size;
                              });
                            },
                            child: Chip(
                                label: Text(
                                  size.toString(),
                                ),
                                backgroundColor: selectedSize == size
                                    ? Theme.of(context).colorScheme.primary
                                    : null),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                  Container(
                    // width: double.infinity,
                    child: ElevatedButton(
                        onPressed:
                            onTap, // is reside outside build function thats why we are calling it from there
                        child: Row(
                          children: [
                            const SizedBox(
                              width: 80,
                            ),
                            Icon(
                              Icons.shopping_cart_checkout,
                              color: Colors.black,
                              size: 20,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            const Text(
                              'Add to Cart',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        style: ElevatedButton.styleFrom(
                          elevation: 10,
                          backgroundColor:
                              Theme.of(context).colorScheme.primary,
                          fixedSize: const Size(400, 50),
                          maximumSize: Size(double.infinity, 50),
                        )),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
