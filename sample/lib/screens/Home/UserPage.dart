import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:sample/models/user.dart';
import 'package:sample/services/auth.dart';
import 'package:sample/services/database.dart';

class UserPage extends StatefulWidget {
  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profile Page'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('users').snapshots(),
        builder: (context, snapshot){
          return ListView.builder(
            itemCount: snapshot.data.docs.length,
            itemBuilder: (context, index){
              DocumentSnapshot users = snapshot.data.docs[index];
              if(snapshot.data == null) return CircularProgressIndicator();
              return ListTile(
                title: Text(users['name']),
                subtitle: Text(users['email']),
              );
            }
          );
        },
        ),
    );
  }
}