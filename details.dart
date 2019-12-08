import 'package:flutter/material.dart';
// import 'dart:async';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

class Details extends StatefulWidget {

   final List list;
   final int index;

  Details({ this.list, this.index});

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {


void confirm(){

}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.list[widget.index]["product_description"]}'),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Text(
              widget.list[widget.index]["product_description"],
              style: TextStyle(fontSize: 20.0),
            ),
            Text(
              widget.list[widget.index]["product_name"],
            ),
            MaterialButton(
              child: Text('EDIT'),
              color: Colors.deepOrangeAccent,
              onPressed: (){},
            ),
            MaterialButton(
              child: Text('DELETE'),
              color: Colors.deepOrangeAccent,
              onPressed: ()=>confirm(),
            ),
          ],
        ),
      ),
    );
  }
}
