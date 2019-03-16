import 'package:flutter/material.dart';
import '../Components/namecard.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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
      body: StreamBuilder(
    stream: Firestore.instance.collection('Q&A').snapshots(),
    builder: (BuildContext context, snapshot){
    if(!snapshot.hasData){
    return CircularProgressIndicator();
    } else {
    print(snapshot.data);
    final children1 = <Widget>[];
    int count = snapshot.data.documents.length;
    for (var i = 0; i < count; i++) {
    children1.add(namecard(i));
    }
    return CustomScrollView(
    shrinkWrap: true,
    slivers: <Widget>[
    SliverPadding(
    padding: const EdgeInsets.all(20.0),
    sliver: SliverList(
    delegate: SliverChildListDelegate(
    children1
    ),
    ),
    ),
    ],
    );
    }
    }
    )
    );
  }
}