
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tradeapp/screens/Page/User.dart';
import 'package:tradeapp/services/auth.dart';

import 'Page/Home.dart';
import 'Page/Search.dart';
import 'Page/Transaction.dart';

class bottomNav extends StatefulWidget {
  // const Home({Key key, this.stock}) : super(key: key);
  @override
  _bottomNavState createState() => _bottomNavState();
  // final stock;
}

class _bottomNavState extends State<bottomNav> {
  
  int _selectedIndex = 0;
  
  final List<Widget> page = [
    Home(),
    Transaction(),
    Search(),
    Users(),
  ];
    void _onItemTapped(int index){
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('TRAPP'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items:[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.blue
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.note_add_sharp),
            label: 'Portfolio',
            backgroundColor: Colors.blue
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
            backgroundColor: Colors.blue
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.supervised_user_circle),
            label: 'User',
            backgroundColor: Colors.blue
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        onTap: _onItemTapped,
      ),
      body: IndexedStack(
        index:_selectedIndex,
        children:page),
    );
  }
}

class stockSearch extends SearchDelegate<String>{
  @override
  List<Widget> buildActions(BuildContext context) {
    return[
        IconButton(icon: Icon(Icons.clear), onPressed:(){query='';})
      ];
    }

    @override
    Widget buildLeading(BuildContext context) {
      return IconButton(icon: Icon(Icons.arrow_back), onPressed: (){close(context, null);});
    }
  
    @override
    Widget buildResults(BuildContext context) {
      return Text("BLOK");
    }
  
    @override
    Widget buildSuggestions(BuildContext context) {
      return Text("BLEK");
  }

}