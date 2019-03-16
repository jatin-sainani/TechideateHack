import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ask extends StatefulWidget
{
  _askstate createState() => new _askstate();
}

class _askstate extends State<ask>
{
  TextEditingController q = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: new AppBar(backgroundColor: Colors.deepPurple, title: new Text("Ask",
        style: new TextStyle(
          fontSize: 30.0,
        ),
      ),
        centerTitle: true,),

      body: new Center(
        
        child: new Column(
          children: <Widget>[

            new Center(

              child: new Text('Ask your question',style: TextStyle(fontSize: 50.0),),
              heightFactor: 5.0,

            ),

            new TextFormField(
              controller: q,
              decoration: InputDecoration(
              hintText: "Your question here",
              hintStyle: TextStyle(
                  color: Colors.white
              ),
              ),
              obscureText: false,

            ),
            new IconButton(icon: Icon(Icons.add,color: Colors.blue,size: 50.0,), onPressed: (){

              Firestore.instance.collection('Q&A').document().setData(
                  {'Question': q.text,'Answer':null});
              print(q.text);
            })

          ],
        ),
        
      ),
      
      
      
    );
  }
}