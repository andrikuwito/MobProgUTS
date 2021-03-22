import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DatabaseService{

  final String uid;
  DatabaseService({this.uid});

  final CollectionReference userCollection = FirebaseFirestore.instance.collection('users');

  Future <void> addUserData (String name, String email) async {
    FirebaseAuth _auth = FirebaseAuth.instance;
    String uid = _auth.currentUser.uid.toString();
    userCollection.add({'name': name, 'email': email, 'uid': uid});
    return;
  }

  Stream<QuerySnapshot> get users{
    return userCollection.snapshots();
  }  
}