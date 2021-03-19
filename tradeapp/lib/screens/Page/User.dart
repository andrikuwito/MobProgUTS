import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tradeapp/services/auth.dart';



class Users extends StatelessWidget {
  depositAlertBox(BuildContext context) {
    TextEditingController custom = TextEditingController();
    TextEditingController custom1 = TextEditingController();
    TextEditingController custom2= TextEditingController();
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              title: Text("Deposit"),
              content: SingleChildScrollView(
                child: Form(
                    child: Column(children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text("Bank Name:", style: TextStyle(fontSize: 20)),
                  ),
                  TextField(controller: custom),
                  Container(margin: EdgeInsets.only(bottom: 30)),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text("Bank Account:", style: TextStyle(fontSize: 20)),
                  ),
                  TextField(controller: custom1, keyboardType: TextInputType.number),
                  Container(margin: EdgeInsets.only(bottom: 30)),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text("Rp:", style: TextStyle(fontSize: 20)),
                  ),
                  TextField(controller: custom2, keyboardType: TextInputType.number),
                ])),
              ),
              actions: <Widget>[
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Deposit'),
                ),
              ],
            
          );
        });
  }
  final AuthService _authService = AuthService();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.fromLTRB(30, 40, 30, 0),
        child: Center(
          child: FutureBuilder <QuerySnapshot>(
            future: FirebaseFirestore.instance.collection('users').get(),
            builder: (context, snapshot) {
              return ListView.builder(
                shrinkWrap: true,
                itemCount: snapshot.data.docs.length,
                itemBuilder: (context, index){
                DocumentSnapshot users = snapshot.data.docs[index];
                  return Column(children: [
              Image.network(
                'https://cdn4.iconfinder.com/data/icons/small-n-flat/24/user-alt-512.png',
                width: 170,
              ),
              ElevatedButton(
                onPressed: () async {
                 await _authService.signOut();
               },
                child: Text('Log Out'),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      depositAlertBox(context);
                    },
                    child: Text('Deposit'),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('Withdraw'),
                  )
                ],
              ),
              Container(margin: EdgeInsets.only(bottom: 30)),
              Align(
                alignment: Alignment.topLeft,
                child: Text("User Info:", style: TextStyle(fontSize: 20)),
              ),
              Container(margin: EdgeInsets.only(bottom: 20)),
              Align(
                alignment: Alignment.topLeft,
                child: Text("Nama: " + users['name'], style: TextStyle(fontSize: 20)),
              ),
              Container(margin: EdgeInsets.only(bottom: 20)),
              Align(
                alignment: Alignment.topLeft,
                child: Text("Email: "+ users['email'], style: TextStyle(fontSize: 20)),
              ),
        ]);
                  }
              );
            }
          ),
        ),
      ),
    );
  }
}

// class UserPage extends StatefulWidget {
//   @override
//   _UserPageState createState() => _UserPageState();
// }

// class _UserPageState extends State<UserPage> {
//   final user = FirebaseAuth.instance.currentUser;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Profile Page'),
//       ),
//       body: FutureBuilder  <QuerySnapshot>(
//         future: FirebaseFirestore.instance.collection('users').get(),
//         builder: (context, snapshot){
//           return ListView.builder(
//             itemCount: snapshot.data.docs.length,
//             itemBuilder: (context, index){
//               DocumentSnapshot users = snapshot.data.docs[index];
//               if (snapshot.connectionState == ConnectionState.done) {
//                 return Column(
//                   children: <Widget> [ 
//                     Text(users['name']),
//                     Text(users['email']),
//                   ]
//                 );
//               }
//               else if (snapshot.connectionState == ConnectionState.none) {
//                 return Text("No data");
//               }   
//               return CircularProgressIndicator();  
//             }
//           );
//         },
//         ),
//     );
//   }
// }