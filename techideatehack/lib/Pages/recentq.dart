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
      appBar: new AppBar(backgroundColor: Colors.deepPurple,),
      body: namecard(0) ,
    );
  }
}