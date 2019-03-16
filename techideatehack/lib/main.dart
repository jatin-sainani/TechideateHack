import 'package:flutter/material.dart';
import 'Pages/login.dart';
import 'Pages/recentq.dart';
import 'intro/intro_page_view.dart';
import 'dashboard/dashboard_one.page.dart';
import 'package:techideatehack/Pages/ask.dart';
import 'package:techideatehack/Pages/favourite.dart';
import 'SwipeAnimation/detail2.dart';
import 'package:techideatehack/homepage.dart';



void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(


        primarySwatch: Colors.blue,
      ),
      home: new IntroPageView(),
      routes: <String,WidgetBuilder>
      {
        'recent': (BuildContext context) => new recentq(),
        'login' : (BuildContext context) => new login(),
        'dashboard' : (BuildContext context) => new DashboardOnePage(),
        'details' : (BuildContext context) => details2(),
        'fav' : (BuildContext context) => favourite(),
        'ask' : (BuildContext context) => ask(),
        'home' : (BuildContext context) => homepage()


      }
    );
  }
}
