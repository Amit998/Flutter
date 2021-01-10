
import 'package:flutter/material.dart';
import 'package:flutter_day_night_animation_ui/screens/login/components/body.dart';
import 'package:flutter_day_night_animation_ui/size_config.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Body(),
    );
  }
}
