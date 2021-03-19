import 'package:flutter/material.dart';
import 'package:tradeapp/models/user.dart';
import 'package:tradeapp/screens/bottomNav.dart';
import 'Page/Home.dart';
import 'sign/Authenticate.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<MyUser>(context);

    if (user == null){
      return Authenticate();
    }
    else {
      return bottomNav();
    }
  }
}