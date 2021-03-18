import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.fromLTRB(30, 40, 30, 0),
        child: Center(
          child: Column(children: [
          Image.network(
            'https://cdn4.iconfinder.com/data/icons/small-n-flat/24/user-alt-512.png',
            width: 170,
          ),
          ElevatedButton(
            onPressed: () {},
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
            child: Text("Nama:", style: TextStyle(fontSize: 20)),
          ),
          Container(margin: EdgeInsets.only(bottom: 20)),
          Align(
            alignment: Alignment.topLeft,
            child: Text("Email:", style: TextStyle(fontSize: 20)),
          ),
        ]),
        ),
      ),
    );
  }
}
