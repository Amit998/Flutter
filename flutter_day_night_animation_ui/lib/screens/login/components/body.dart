import 'package:flutter/material.dart';
import 'package:flutter_day_night_animation_ui/screens/login/components/round_text_field.dart';
import 'package:flutter_day_night_animation_ui/screens/login/components/tabs.dart';
import 'package:flutter_day_night_animation_ui/size_config.dart';
import 'package:flutter_svg/svg.dart';

import 'land.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool _isFullSun = false;
  bool _isDayMode = true;

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        _isFullSun = true;
      });
    });
  }

  Function changeMode(int value) {
    if (value == 0) {
      setState(() {
        _isFullSun = true;
      });
      Future.delayed(Duration(microseconds: 300), () {
        setState(() {
          _isDayMode = true;
        });
      });
    } else {
      setState(() {
        _isFullSun = false;
      });
      Future.delayed(Duration(microseconds: 300), () {
        setState(() {
          _isDayMode = false;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Color> lightBgColors = [
      Color(0xFF8C2480),
      Color(0xFFCE587D),
      Color(0xFFFF9485),
      if (_isFullSun) Color(0xFFFF9080)
    ];

    List<Color> darkBgColors = [
      Color(0xFF0D1441),
      Color(0xFF283584),
      Color(0xFFFF9485),
    ];

    Duration duration_ = Duration(seconds: 1);
    return AnimatedContainer(
      duration: duration_,
      width: double.infinity,
      height: SizeConfig.screenHeight,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: _isDayMode ? lightBgColors : darkBgColors,
        ),
      ),
      child: Stack(
        children: [
          AnimatedPositioned(
            curve: Curves.easeInOut,
            duration: duration_,
            left: getProportionateScreenWidth(30),
            bottom: getProportionateScreenWidth(_isFullSun ? -45 : -170),
            child: SvgPicture.asset("assets/icons/Sun.svg"),
          ),
          Land(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  VerticalSpacing(of: 50),
                  Tabs(
                    press: (value) {
                      changeMode(value);
                    },
                  ),
                  VerticalSpacing(),
                  Text(
                    _isDayMode ? "Good Morning" : "Sleepy Night",
                    style: Theme.of(context).textTheme.headline3.copyWith(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  VerticalSpacing(of: 10),
                  Text(
                    "Enter your Informations below",
                    style: TextStyle(color: Colors.white),
                  ),
                  VerticalSpacing(of: 50),
                  RoundedTextField(
                    initialValue: "ourdemo@email.com",
                    hintText: "Email",
                  ),
                  VerticalSpacing(),
                  RoundedTextField(
                    initialValue: "XXXXXXX",
                    hintText: "Password",
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
