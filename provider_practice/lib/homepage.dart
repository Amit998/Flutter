import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_practice/cartPage.dart';
import 'package:provider_practice/myCartModel.dart';
import 'package:provider_practice/myUser.dart';
import 'package:provider_practice/someValues.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List cartList = [];

  @override
  Widget build(BuildContext context) {
    var id = Provider.of<MyData>(context, listen: false).id;
    return Scaffold(
      appBar: AppBar(
        title: Text("Provider Demo"),
        actions: [
          Stack(
            children: [
              IconButton(
                icon: Icon(Icons.shopping_cart),
                onPressed: () {},
              ),
            ],
          ),
          InkWell(
            onTap: () {},
            child: Center(
              child: Text("Sign In"),
            ),
          ),
          SizedBox(width: 10),
        ],
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Container(
              height: 200,
              margin: EdgeInsets.only(top: 10),
              decoration: BoxDecoration(color: Colors.grey),
              child: Center(
                child: Consumer<MyCart>(
                  builder: (context, myCart, child) => Text(
                    myCart.cartList.length.toString(),
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ),
            // SizedBox(
            //   height: 10,
            // ),
            Container(
              height: 290,
              margin: EdgeInsets.only(bottom: 10, top: 10),
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: 10,
                scrollDirection: Axis.horizontal,
                itemBuilder: (_, index) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => CartPage()));
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        height: 200,
                        width: 150,
                        child: Text(''),
                        color: Colors.grey,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10, top: 10),
                      child: Text(
                        "Product Name",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Consumer<MyCart>(
                      builder: (context, myCart, child) => Container(
                        height: 26,
                        child: RaisedButton(
                          color: Colors.blue,
                          onPressed: () {
                            myCart.addToCart(index);
                          },
                          child: Text(
                            "Add to cart",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    )
                    // Consumer(
                    //   builder: (context, myCart, child) => FlatButton(
                    //     color: Colors.blue,
                    //     onPressed: () {
                    //       myCart.addToCart(index);
                    //     },
                    //     child: Text(
                    //       "Add To Cart",
                    //       style: TextStyle(color: Colors.white),
                    //     ),
                    //   ),
                    // )
                  ],
                ),
              ),
            ),

            Consumer<MyUser>(
              builder: (context, myUser, child) => Container(
                height: 120,
                width: double.infinity,
                color: Colors.blue,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(height: 10),
                      Text(
                        myUser.isSignedIn ? " ${id} User Sign In" : "Sign Out ",
                        style: TextStyle(color: Colors.white, fontSize: 30),
                      ),
                      RaisedButton(
                        color: Colors.blueGrey,
                        onPressed: () {
                          myUser.changesStatus();
                        },
                        child: Text(
                          "Sign In",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      SizedBox(height: 10)
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
