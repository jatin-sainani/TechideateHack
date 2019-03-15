import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/animation.dart';
import '../Animation/loginanimation.dart';
class login extends StatefulWidget
{
  _loginstate createState() => new _loginstate();


}

class _loginstate extends State<login> with TickerProviderStateMixin {

  AnimationController _loginButtonController;
  var animationStatus = 0;
  var animationStatus2=0;

  @override
  void initState() {
    super.initState();
    _loginButtonController = new AnimationController(
        duration: new Duration(milliseconds: 3000), vsync: this);
  }

  @override
  void dispose() {
    _loginButtonController.dispose();
    super.dispose();
  }

  Future<Null> _playAnimation() async {
    try {
      await _loginButtonController.forward();
      await _loginButtonController.reverse();
    } on TickerCanceled {}
  }

  Future<bool> _onWillPop() {
    return showDialog(
      context: context,
      child: new AlertDialog(
        title: new Text('Are you sure?'),
        actions: <Widget>[
          new FlatButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: new Text('No'),
          ),
          new FlatButton(
            onPressed: () =>
                Navigator.of(context).pop(true),
            child: new Text('Yes'),
          ),
        ],
      ),
    ) ??
        false;
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return (

        new WillPopScope(
          onWillPop: _onWillPop,
          child: new Scaffold(
              body: new Container(
                  decoration: new BoxDecoration(
                    color: Colors.white,
                  ),
                  child: new Container(
                    decoration: new BoxDecoration(
                        gradient: new LinearGradient(
                          colors: <Color>[
                            const Color.fromRGBO(162, 146, 199, 0.8),
                            const Color.fromRGBO(51, 51, 63, 0.9),
                          ],
                          stops: [0.2, 1.0],
                          begin: const FractionalOffset(0.0, 0.0),
                          end: const FractionalOffset(0.0, 1.0),
                        )),
                    child: new ListView(
                        padding: const EdgeInsets.all(0.0),
                        children: <Widget>[

                          new Stack(
                            alignment: AlignmentDirectional.bottomCenter,
                            children: <Widget>[
                              new Column(
                                mainAxisAlignment: MainAxisAlignment
                                    .spaceEvenly,
                                children: <Widget>[
                                  new Container(
                                      width: 250.0,
                                      height: 250.0,
                                      alignment: Alignment.center,
                                      decoration: new BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage('images/tick.png'),
                                        ),
                                      )),

                                  //Tick
                                  new Container(
                                    margin: new EdgeInsets.symmetric(
                                        horizontal: 20.0),
                                    child: new Column(
                                      mainAxisAlignment: MainAxisAlignment
                                          .spaceEvenly,
                                      children: <Widget>[
                                        new Form(
                                            child: new Column(
                                              mainAxisAlignment: MainAxisAlignment
                                                  .spaceAround,
                                              children: <Widget>[
                                                new TextFormField(
                                                  decoration: InputDecoration(
                                                    hintText: "Username",
                                                    icon: Icon(Icons.person),

                                                  ),
                                                  obscureText: false,
                                                ),

                                                new TextFormField(
                                                  decoration: InputDecoration(
                                                    hintText: "Password",
                                                    icon: Icon(Icons.lock),

                                                  ),
                                                  obscureText: true,
                                                )
                                              ],
                                            )),
                                      ],
                                    ),
                                  ), //form


                                  new FlatButton(
                                    padding: const EdgeInsets.only(
                                      top: 160.0,
                                    ),
                                    onPressed: null,
                                    child: new Text(
                                      "Don't have an account? Sign Up",
                                      textAlign: TextAlign.center,
                                      overflow: TextOverflow.ellipsis,
                                      softWrap: true,
                                      style: new TextStyle(
                                          fontWeight: FontWeight.w300,
                                          letterSpacing: 0.5,
                                          color: Colors.white,
                                          fontSize: 12.0),
                                    ),
                                  ) //sign

                                ],
                              ),
                                  animationStatus == 0
                                      ? new Padding(
                                      padding: const EdgeInsets.only(bottom: 55.0),
                                      child: new InkWell(
                                          onTap: ()
                                           {
                                            setState(() {
                                              animationStatus = 1;
                                            });
                                             _playAnimation();
                                           //Navigator.of(context).pushReplacementNamed('recent');

                                          },
                                          child:
                                          new Container(
                                            width: 320.0,
                                            height: 60.0,
                                            alignment: FractionalOffset.center,
                                            decoration: new BoxDecoration(
                                              color: const Color.fromRGBO(247, 64, 106, 1.0),
                                              borderRadius: new BorderRadius.all(const Radius.circular(30.0)),
                                            ),

                                            child: new Text(
                                              "Sign In",
                                              style: new TextStyle(
                                                color: Colors.white,
                                                fontSize: 20.0,
                                                fontWeight: FontWeight.w300,
                                                letterSpacing: 0.3,
                                              ),
                                            ),
                                          )
                                      )
                                  )
                                      : new StaggerAnimation(
                                      buttonController:
                                      _loginButtonController.view), //normal sign in////

                                ],

                              )

                            ],
                          )
                    ),
                  )))
        );
  }
}