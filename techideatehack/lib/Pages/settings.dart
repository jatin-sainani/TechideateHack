import 'package:flutter/material.dart';

class settings extends StatefulWidget
{
  _settingsstate createState() => new _settingsstate();
}

class _settingsstate extends State<settings>
{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
appBar: new AppBar(backgroundColor: Colors.deepPurple, title: new Text("Settings",
      style: new TextStyle(
        fontSize: 30.0,
      ),
    ),
      centerTitle: true,),
      body: new Center(
          child:
      new RaisedButton(onPressed: (){Navigator.pushReplacementNamed(context, 'login');},child: Icon(Icons.exit_to_app,color: Colors.blue,),color: Colors.white,),
      )

    );
  }
}