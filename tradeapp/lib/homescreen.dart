import 'package:flutter/material.dart';


class Homescreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (context,index){
    return Container(
      padding: EdgeInsets.fromLTRB(10,5,10,0),
      height: 100,
      child:Card(
        child: Column(
          children: <Widget>[
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children:[
              Text('ANTM',style: TextStyle(fontSize: 20)),
              Text('9999',style: TextStyle(fontSize: 20))],),
              Container(margin: EdgeInsets.only(top:5)),
            Align(alignment:Alignment.topLeft, child: Text('Aneka Tambang Tbk.',style: TextStyle(fontSize: 15)),),
            
          ],
        ),
      )
    );
  });
  }
}