import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_practice/myCartModel.dart';

class CartPage extends StatefulWidget {
  // final List cartlist;

  // const CartPage({Key key, this.cartlist}) : super(key: key);
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Consumer<MyCart>(
          builder: (context, myCart, child) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(myCart.cartList.length.toString()),
              FlatButton(
                color: Colors.blue,
                child: Text("Delete One Element"),
                onPressed: () {
                  // setState(() {
                  // widget.cartlist.removeLast();
                  myCart.removeCart();
                  // });
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
