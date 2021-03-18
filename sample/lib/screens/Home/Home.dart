import 'package:sample/screens/Home/UserPage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample/services/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('TRAPP', style: TextStyle(color: Colors.black),),
          backgroundColor: Colors.white,
          elevation: 0.0,
          actions: <Widget>[
            FlatButton.icon(
              icon: Icon(Icons.person),
              label: Text('LogOut'),
              onPressed: () async {
                await _auth.signOut();
              },
            )
          ],
        ),
        body: UserPage(),
      ),
    );
  }
}