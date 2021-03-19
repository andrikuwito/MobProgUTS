import 'package:flutter/material.dart';
import 'package:tradeapp/services/auth.dart';
import 'package:tradeapp/services/database.dart';

class Register extends StatefulWidget {
  final Function toggleView;
  Register({this.toggleView});


  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController _pass = TextEditingController();
  final TextEditingController _confirmPass = TextEditingController();
  final GlobalKey<FormState> _form = GlobalKey<FormState>();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _fullName = TextEditingController();

  final AuthService _authService = AuthService();
  
  String email = '';
  String password = '';
  String error = '';
  String fullName = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(140.0),
        child: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          elevation: 0.0,
          flexibleSpace: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 100),
            Center(
              child: Text('Sign Up', style: TextStyle(color: Colors.black, fontSize: (50)),
                ),
              ),
            ],
          )
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
          child: Form(
            key: _form,
            child: Column(
              children: <Widget>[
                SizedBox(height: 20.0),
                TextFormField(
                  controller: _fullName,
                  autovalidateMode: AutovalidateMode.onUserInteraction  ,
                  decoration: new InputDecoration(
                    labelText: "Enter Full Name",
                    fillColor: Colors.white,
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(25.0),
                      borderSide: new BorderSide(),
                    ),
                  ),
                  validator: (val) {
                    if (val.isEmpty) {
                      return "Name cannot be empty";
                    } 
                      return null;
                  },
                  onChanged: (val) {
                    setState(() => fullName = val.trim());
                  },
                  keyboardType: TextInputType.name,
                  style: new TextStyle(
                    fontFamily: "Poppins",
                  ),
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  controller: _email,
                  autovalidateMode: AutovalidateMode.onUserInteraction  ,
                  decoration: new InputDecoration(
                    labelText: "Enter Email",
                    fillColor: Colors.white,
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(25.0),
                      borderSide: new BorderSide(),
                    ),
                  ),
                  validator: (val) {
                    if (val.isEmpty) {
                      return "Email cannot be empty";
                    } 
                      return null;
                  },
                  onChanged: (val) {
                    setState(() => email = val.trim());
                  },
                  keyboardType: TextInputType.emailAddress,
                  style: new TextStyle(
                    fontFamily: "Poppins",
                  ),
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  obscureText: true,
                  decoration: new InputDecoration(
                    labelText: "Enter Password",
                    fillColor: Colors.white,
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(25.0),
                      borderSide: new BorderSide(),
                    ),
                    //fillColor: Colors.green
                  ),
                  controller: _pass,
                  validator: (val) {
                    if (val.isEmpty) {
                      return "Password cannot be empty";
                    } 
                    if (val.length < 8){
                      return "Password cannot be less than 8 character";
                    }
                      return null;
                  },
                  onChanged: (val) {
                    setState(() => password = val.trim());
                  },    
                  keyboardType: TextInputType.visiblePassword,
                  style: new TextStyle(
                    fontFamily: "Poppins",
                  ),
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: _confirmPass,
                  obscureText: true,
                  decoration: new InputDecoration(
                    labelText: "Confirm Password",
                    fillColor: Colors.white,
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(25.0),
                      borderSide: new BorderSide(),
                    ),
                    //fillColor: Colors.green
                  ),
                  validator: (val) {
                    if (val.length == 0) {
                      return "Password cannot be empty";
                      }
                    if (val != _pass.text){
                      return 'Not Match';
                      }
                      return null;
                    },
                    
                  keyboardType: TextInputType.visiblePassword,
                  style: new TextStyle(
                    fontFamily: "Poppins",
                  ),
                ),
                SizedBox(height: 20),
                Text(error, style: TextStyle(color: Colors.red, fontSize: 14),
                ),
                SizedBox(height: 20),
                TextButton(
                onPressed: () async {
                  if (_form.currentState.validate()){
                    dynamic result = await _authService.registerWithEmailAndPassword(email, password);
                    DatabaseService().addUserData(_fullName.text, _email.text);
                    if (result == null){
                      setState(() => error = 'please enter a valid email');
                    }
                  }
                }, 
                child: 
                Text ("Register", style: TextStyle(color: Colors.white)), 
                style: ButtonStyle(
                    padding: MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 15, horizontal: 100)),
                    textStyle: MaterialStateProperty.all(TextStyle(fontSize: 30)),
                    backgroundColor: MaterialStateProperty.all(Colors.teal[300])
                  )
                ),
                SizedBox(height: 20.0),
                Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [ 
                  Text("Already have an account ?",style: TextStyle(fontSize: 20)),
                  TextButton(
                  onPressed: () {
                  widget.toggleView();
                  },
                  child: Text('Sign In', style: TextStyle(fontSize: 20),),
                  ),
                  
                ],
                ),
              ],
            ),
          )
        ),
      ),
    );
  }
}