import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_practice/cartPage.dart';
import 'package:provider_practice/myCartModel.dart';
import 'package:provider_practice/myUser.dart';
import 'package:provider_practice/someValues.dart';
import './homepage.dart';

void main() {
  runApp(MyApp());
}

// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (_)=> MyCart(),
//       child: MaterialApp(
//         debugShowCheckedModeBanner: false,
//         title: 'Flutter Demo',
//         theme: ThemeData(
//           primarySwatch: Colors.blue,
//         ),
//         home: Homepage(),
//       ),
//     );
//   }
// }

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<MyCart>(
          create: (_) => MyCart(),
        ),
        ChangeNotifierProvider<MyUser>(
          create: (_) => MyUser(),
        ),
        Provider(
          create:(_)=>MyData(),
          )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Homepage(),
      ),
    );
  }
}
