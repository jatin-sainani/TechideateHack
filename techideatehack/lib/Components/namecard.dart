import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class namecard extends StatefulWidget{
  int index;
  namecard(this.index);
  _namecardstate createState() => new _namecardstate();
}

class _namecardstate extends State<namecard>
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
                  stream: Firestore.instance.collection('Q&A').snapshots(),
                  builder: (context,snapshot){
                    if(!snapshot.hasData)
                    {
                      question=('Please wait...');}
                    else {
                      question = snapshot.data.documents[widget.index]['Question'];
                    }
                    return
                      Text(question,style: TextStyle(fontSize: 30 ),);
                  }
              ),
              subtitle: StreamBuilder(
                  stream: Firestore.instance.collection('Q&A').snapshots(),
                  builder: (context,snapshot){
                    if(!snapshot.hasData)
                    {answer=('Please wait...');}
                    else {
                      answer = snapshot.data.documents[widget.index]['Answer'];
                    }
                    return Text(answer,style: TextStyle(fontSize: 25),);
                  }
              ),
            ),
            /*ButtonTheme.bar(
// make buttons use the appropriate styles for cards
              child: ButtonBar(
                children: <Widget>[
                  FlatButton(
                      child: const Text('Bookmark'),
                      onPressed: () async{
                        await Firestore.instance.collection('Bookmark').document().setData(
                            {'Question': question,'Answer':answer});
                        return SnackBar(content: Text('Bookmark added'),duration: Duration(seconds: 2),);
                      }
                  ),
                  FlatButton(
                    child: const Text('Images'),
                    onPressed: () {Navigator.of(context).pushNamed('scroll');},
                  ),
                ],
              ),
            ),*/
          ],
        ),
      ),
    );
  }
}
