import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:techideatehack/Components/namecardbookmark.dart';

class favourite extends StatefulWidget
{
  _favouritestate createState() =>  new _favouritestate();
}

class _favouritestate extends State<favourite> {
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
            stream: Firestore.instance.collection('Favourite').snapshots(),
            builder: (BuildContext context, snapshot){
              if(!snapshot.hasData){
                return CircularProgressIndicator();
              } else {
                print(snapshot.data);
                final children1 = <Widget>[];
                int count = snapshot.data.documents.length;
                for (var i = 0; i < count; i++) {
                  children1.add(namecardbookmark(i));
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
