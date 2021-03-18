import 'dart:convert';
import 'package:UTS/stockdetails.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
// import 'main.dart';

class Homescreen extends StatefulWidget {
  @override
  _HomescreenState createState() => _HomescreenState();
}

String changesymbol(String s) {
  return '${s.replaceAll('.JK', '')}';
}

String lowercase(String s) {
  return '${s.toLowerCase()}';
}

class _HomescreenState extends State<Homescreen> {
  @override
  void initState() {
    super.initState();
    this.stocks();
    // Navigator.push(context, MaterialPageRoute(builder: (context)=>home(stock:saham)));
  }
  List saham=[];
  List allstock=[];
  
  Future<void>stocks()async{
    String Url="https://finnhub.io/api/v1/stock/symbol?exchange=JK&token=c12t6dv48v6oi2531ibg";
    var api = await http.get(Url);
    if(api.statusCode==200){
      var stock=json.decode(api.body);
      setState(() {
        saham=stock;
      });
    }
    for(int i=0;i<10;i++){
      var harga=lowercase(saham[i]['symbol']);
      String Urlharga="https://finnhub.io/api/v1/quote?symbol=${harga}&token=c12t6dv48v6oi2531ibg";
      String UrlChart="https://finnhub.io/api/v1/stock/candle?symbol=${harga}&resolution=D&from=1600651390&to=2021243390&token=c12t6dv48v6oi2531ibg";
      var hargaapi = await http.get(Urlharga);
      var chartapi = await http.get(UrlChart);
      if(hargaapi.statusCode==200){
        var stockharga=json.decode(hargaapi.body);
        var chartsaham=json.decode(chartapi.body);
        var x={
          "price":stockharga['c'].toString(),
          "nama":saham[i]['symbol'],
          "description":saham[i]['description'],
          "chart":chartsaham['c'].toString()
        };
        setState(() {
          allstock.add(x);
        });
      }
    }
  }
  @override
  Widget build(BuildContext context) {
   return ListView.builder(itemCount:allstock.length,itemBuilder: (context,index){
     var sahamm=allstock[index];
    return InkWell( onTap:(){
      Navigator.push(context, MaterialPageRoute(builder:(context)=>stockdetail(saham:sahamm)));
    },
    child:Container(
      padding: EdgeInsets.fromLTRB(10,5,10,0),
      height: 100,
      child:Card(
        child: Column(
          children: <Widget>[
            Container(margin: EdgeInsets.only(top:10)),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children:[
              Text(changesymbol(sahamm['nama'].toString()),style: TextStyle(fontSize: 20)),
              Text(sahamm['price'],style: TextStyle(fontSize: 20))],),
              Container(margin: EdgeInsets.only(top:10)),
            Align(alignment:Alignment.topLeft, child: Text(sahamm['description'],style: TextStyle(fontSize: 15)),),
          ],
        ),
      )
    )
    );
    
  });
  }
}