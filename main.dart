// ip  192.168.0.130

import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'details.dart';
import 'dart:convert';

void main() => runApp(MaterialApp(
  title: 'My App Test',
  debugShowCheckedModeBanner: false,
  theme: ThemeData(
    primarySwatch: Colors.red,
  ),
  home: Home(),
));



class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

Future<List> getData() async {
  final response = await http.get("http://192.168.0.197/flutter_db/products.php");
  return json.decode(response.body);
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My App Bar'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child: Icon(Icons.add),
      ),
      body: FutureBuilder<List>(
        future: getData(),
        builder: (ctx, ss){
          if(ss.hasError){
            print("error");
          }
          if(ss.hasData){
            return Items(list:ss.data);
          }
          else{
            return CircularProgressIndicator();
          }
        }
        ),
    );
  }
}


class Items extends StatelessWidget {
  final List list;

  Items({ this.list });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list == null ? 0 : list.length,
      itemBuilder: (ctx, i){
        return ListTile(
          leading: Icon(Icons.message),
           title: Text(list[i]['Id']),
          subtitle: Text(list[i]['product_name']),
          onTap: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) => Details(list:list,index:i),
          ),
          ),
        );
      }
      );
  }
}
