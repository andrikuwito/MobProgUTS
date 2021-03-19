import 'package:flutter/material.dart';

class Search extends StatelessWidget {
  @override
  TextEditingController custom = TextEditingController();
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.search),
      title: TextField(controller:custom,),
      trailing: IconButton(onPressed:(){
        showSearch(context: context, delegate: stocksearch());
      },icon: Icon(Icons.clear),
      ),
    );
  }

}

  class stocksearch extends SearchDelegate<String>{
  @override
  List<Widget> buildActions(BuildContext context) {
     return[
        IconButton(icon: Icon(Icons.clear), onPressed:(){query='';})
      ];
    }
  
    @override
    Widget buildLeading(BuildContext context) {
      // TODO: implement buildLeading
      throw UnimplementedError();
    }
  
    @override
    Widget buildResults(BuildContext context) {
      // TODO: implement buildResults
      throw UnimplementedError();
    }
  
    @override
    Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    throw UnimplementedError();
  }
    
  }
