import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class namecardbookmark extends StatefulWidget{
  int index;
  namecardbookmark(this.index);

  _namecardbookmarkstate createState() => new _namecardbookmarkstate();
}

class _namecardbookmarkstate extends State<namecardbookmark>
{
  String question;
  String answer;



  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        // color: secondary,
        child: Column(
          children: <Widget>[

            ListTile(
              //leading: Icon(Icons.album),
              title: StreamBuilder(
                  stream: Firestore.instance.collection('Favourite').snapshots(),
                  builder: (context,snapshot){
                    if(!snapshot.hasData)
                    {
                      question=('Please wait...');}
                    else {
                      question = snapshot.data.documents[widget.index]['Question'];
                    }
                    return
                      Center(child: Text(question,style: TextStyle(fontSize: 30 ),));
                  }
              ),
              subtitle: StreamBuilder(
                  stream: Firestore.instance.collection('Favourite').snapshots(),
                  builder: (context,snapshot){
                    if(!snapshot.hasData)
                    {answer=('Please wait...');}
                    else {
                      answer = snapshot.data.documents[widget.index]['Answer'];
                    }
                    return Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Text(answer,style: TextStyle(fontSize: 25,height: 0.85),),
                    );
                  }
              ),
            ),
          ],
        ),
      ),
    );
  }
}
