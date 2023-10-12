import 'package:flutter/material.dart';

class Product123 extends StatelessWidget {
  final String title;
  final double price;
  final String image;
  final Color backgroundC;
  Product123({
    super.key,
    required this.title,
    required this.price,
    required this.image,
    required this.backgroundC,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: backgroundC,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                title,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            const SizedBox(
              height: 6,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 10,
              ),
              child: Text('\$$price',
                  style: Theme.of(context).textTheme.bodySmall),
            ),
            const SizedBox(
              height: 6,
            ),
            Center(child: Image.asset(image, height: 160))
          ],
        )); // container se hum big card bna rhe hai. Card widget se bhibna skte the but that will give elevation effect behind.
  }
}
