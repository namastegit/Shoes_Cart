import 'package:flutter/material.dart';
import 'package:my_flutter_app3/cart_provider.dart';
// import 'package:my_flutter_app3/globalvar.dart';
import 'package:provider/provider.dart';
// import 'package:my_flutter_app3/productList.dart';

class CartPage extends StatelessWidget {
  CartPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final cart = (Provider.of<CartProvider>(context).cart);
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          'Cart Page',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        )),
      ),
      body: ListView.builder(
        itemCount: cart.length,
        itemBuilder: (context, index) {
          // context is here because sbhi builders me hota hai context
          final cartItem33 = cart[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(cartItem33['imageUrl'] as String),
              radius: 35,
            ),
            trailing: IconButton(
              onPressed: () {
                showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text(
                        'Delete Product',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      content: Text('Are you sure',
                          style: TextStyle(fontWeight: FontWeight.normal)),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            "NO",
                            style: TextStyle(color: Colors.blue),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Provider.of<CartProvider>(context, listen: false)
                                .removeProduct(cartItem33);
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            'YES',
                            style: TextStyle(
                                color: Color.fromARGB(255, 231, 0, 0)),
                          ),
                        )
                      ],
                    );
                  },
                );
              },
              icon: Icon(
                Icons.delete_rounded,
                color: Color.fromARGB(255, 238, 8, 0),
              ),
            ),
            title: Text(
              cartItem33['title'].toString(),
              style: Theme.of(context).textTheme.titleMedium,
            ),
            subtitle: Text('Size:${cartItem33['sizes']}'),
          );
        },
      ),
    );
  }
}
