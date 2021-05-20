import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rive_test_1/smileController.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  SmileyController _smileyController = SmileyController();

  double _rating = 1;
  String _currentAnimation = '5+';

  _onChanged(double value) {
    if (_rating == value) {
      return;
    }
    setState(() {
      var direction = _rating < value ? '+' : '-';

      _rating = value;
      _currentAnimation = "${value.round()}$direction";
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Rive Demo"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                height: 300,
                width: 300,
                child: FlareActor(
                  "assets/happiness_emoji.flr",
                  alignment: Alignment.center,
                  fit: BoxFit.contain,
                  animation: _currentAnimation,
                  controller: _smileyController,
                )),
            Slider(
              value: _rating,
              min: 1,
              max: 5,
              divisions: 4,
              onChanged: _onChanged,
            ),
            Text(
              "${_rating}",
              style: Theme.of(context).textTheme.headline4,
            )
          ],
        ),
      ),
    );
  }
}
