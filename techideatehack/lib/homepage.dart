import 'package:flutter/material.dart';
import 'package:techideatehack/Pages/ask.dart';
import 'package:techideatehack/Pages/recentq.dart';
import 'package:techideatehack/Pages/favourite.dart';
import 'package:techideatehack/Pages/settings.dart';
class homepage extends StatefulWidget{
  _homepagestate createState() => new _homepagestate();
}

class _homepagestate extends State<homepage> with TickerProviderStateMixin
{
  int selectedIndex = 0;
  final _widgetOptions = [
    //new profile(),
    //new group(),
    new recentq(),
    new ask(),
    new favourite(),
    new settings()
    //new activity(),
    //new me(),

  ];
  final _appbartext=[
    Text('Recent Questions'),
    Text('Ask '),
    Text('Favourites'),
    Text('Settings'),
  ];
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold
      (
      body: _widgetOptions[selectedIndex],
      bottomNavigationBar: new BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home'),backgroundColor: Colors.deepPurple),
          BottomNavigationBarItem(icon: Icon(Icons.add), title: Text('Ask'),backgroundColor: Colors.deepPurple),
          BottomNavigationBarItem(icon: Icon(Icons.bookmark), title: Text('Bookmark'),backgroundColor: Colors.deepPurple),
          BottomNavigationBarItem(icon: Icon(Icons.settings), title: Text('Setting'),backgroundColor: Colors.deepPurple),
        ],
        currentIndex: selectedIndex,
        fixedColor: Colors.deepPurple,
        onTap: _onItemTapped,

      ),
    );

  }
  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }
}
