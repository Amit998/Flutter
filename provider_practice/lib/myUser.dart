import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import 'package:flutter/material.dart';

class MyUser extends ChangeNotifier {
  bool isSignedIn = false;

  changesStatus() {
    isSignedIn = !isSignedIn;
    notifyListeners();
  }
}
