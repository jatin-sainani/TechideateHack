import 'package:flutter/material.dart';
import '../Components/namecard.dart';

class recentq extends StatefulWidget
{
  _recentqstate createState ()=> new _recentqstate();
}

class _recentqstate extends State<recentq>
{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold
      (
      appBar: new AppBar(backgroundColor: Colors.deepPurple, title: new Text("Recent Qs",
        style: new TextStyle(
          fontSize: 30.0,
        ),
      ),
      centerTitle: true,),
      body:new
          ListView(
            children: <Widget>[
              new namecard(0),
              new Container(height: 10.0,),
              new namecard(1),

            ],
          ),
      );
  }
}