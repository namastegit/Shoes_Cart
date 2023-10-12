import 'package:flutter/material.dart';
import 'package:my_flutter_app3/cart_provider.dart';
import 'package:my_flutter_app3/globalvar.dart';
import 'package:my_flutter_app3/home_page.dart';
import 'package:my_flutter_app3/product_details.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp3());
}

class MyApp3 extends StatelessWidget {
  const MyApp3({super.key});

  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      //it stores data
      create: (context) => CartProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Shopping App',
        theme: ThemeData(
          fontFamily: 'Lato',

          colorScheme: ColorScheme.fromSeed(
            seedColor: Color.fromRGBO(254, 206, 1, 1),
            primary: Color.fromRGBO(254, 206, 1, 1),
          ),
          inputDecorationTheme: const InputDecorationTheme(
            hintStyle: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
            prefixIconColor: Color.fromRGBO(119, 119, 119, 1),
          ),

          textTheme: TextTheme(
              titleLarge: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
              titleMedium: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              titleSmall: TextStyle(fontSize: 21, fontWeight: FontWeight.w500),
              bodySmall: TextStyle(fontSize: 30, fontWeight: FontWeight.w700)),
          useMaterial3: true,

          // from seed color we can generate primary, secondary surface colors.
        ),
        home: HomePage1(),
      ),
    );
  }
}
