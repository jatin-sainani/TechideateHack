import 'package:flutter/material.dart';
import 'Pages/login.dart';
import 'Pages/recentq.dart';
import 'intro/intro_page_view.dart';
import 'dashboard/dashboard_one.page.dart';
import 'package:techideatehack/SwipeAnimation/index.dart';
import 'SwipeAnimation/detail2.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: new recentq(),
      routes: <String,WidgetBuilder>
      {
        'recent': (BuildContext context) => new recentq(),
        'login' : (BuildContext context) => new login(),
        'dashboard' : (BuildContext context) => new DashboardOnePage(),
        'details' : (BuildContext context) => details2()

      }
    );
  }
}
