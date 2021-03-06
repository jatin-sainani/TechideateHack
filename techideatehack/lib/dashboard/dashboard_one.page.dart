import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import './dashboard_menu_row.dart';
import './login_background.dart';
import './profile_tile.dart';
import './uidata.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DashboardOnePage extends StatelessWidget {
  Size deviceSize;

  BuildContext context;
  Widget appBarColumn(BuildContext context) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 18.0),
          child: new Column(
            children: <Widget>[
              new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  new IconButton(
                    icon: new Icon(
                      defaultTargetPlatform == TargetPlatform.android
                          ? Icons.arrow_back
                          : Icons.arrow_back_ios,
                      color: Colors.white,
                    ),
                    onPressed: () => Navigator.canPop(context)
                        ? Navigator.pop(context)
                        : null,
                  ),
                  new ProfileTile(
                    title: "Hello",
                    subtitle: "Welcome to Career Community! ",
                    textColor: Colors.white,
                  ),
                  new IconButton(
                    icon: new Icon(
                      Icons.more_vert,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      print("hi");
                    },
                  )
                ],
              ),
            ],
          ),
        ),
      );

  Widget searchCard() => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          elevation: 2.0,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Icon(Icons.search),
                SizedBox(
                  width: 10.0,
                ),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none, hintText: "Find our product"),
                  ),
                ),
                Icon(Icons.menu),
              ],
            ),
          ),
        ),
      );

  Widget actionMenuCard() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Card(
          elevation: 2.0,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  InkWell(
              splashColor: Colors.pinkAccent,
                    onTap: (){Navigator.of(context).pushNamed('recent');},
                    child: DashboardMenuRow(

                      firstIcon: FontAwesomeIcons.users,
                      firstLabel: "QnA",
                      firstIconCircleColor: Colors.blue,
                      secondIcon: FontAwesomeIcons.plus,
                      secondLabel: "Ask Questions",
                      secondIconCircleColor: Colors.orange,
                      thirdIcon: FontAwesomeIcons.user,
                      thirdLabel: "Profile",
                      thirdIconCircleColor: Colors.purple,
                      fourthIcon: FontAwesomeIcons.solidHeart,
                      fourthLabel: "Favourites",
                      fourthIconCircleColor: Colors.indigo,
                    ),
                  ),
                  
                  InkWell(
                    splashColor: Colors.pinkAccent,
                    onTap:(){Navigator.of(context).pushNamed('fav');
                    print('role');},
                    child: DashboardMenuRow(
                      firstIcon: FontAwesomeIcons.question,
                      firstLabel: "Asked Qs",
                      firstIconCircleColor: Colors.red,
                      secondIcon: FontAwesomeIcons.book,
                      secondLabel: "After 10th?",
                      secondIconCircleColor: Colors.teal,
                      thirdIcon: FontAwesomeIcons.graduationCap,
                      thirdLabel: "After 12th?",
                      thirdIconCircleColor: Colors.lime,
                      fourthIcon: FontAwesomeIcons.solidCommentDots,
                      fourthLabel: "Reviews",
                      fourthIconCircleColor: Colors.amber,
                    ),
                  ),
                  InkWell(
                      splashColor: Colors.pinkAccent,
                    onTap:(){ Navigator.of(context).pushNamed('ask');},
                    child: DashboardMenuRow(
                      firstIcon: FontAwesomeIcons.file,
                      firstLabel: "Test",
                      firstIconCircleColor: Colors.cyan,
                      secondIcon: FontAwesomeIcons.map,
                      secondLabel: "Locate",
                      secondIconCircleColor: Colors.redAccent,
                      thirdIcon: FontAwesomeIcons.blogger,
                      thirdLabel: "Articles",
                      thirdIconCircleColor: Colors.pink,
                      fourthIcon: FontAwesomeIcons.cog,
                      fourthLabel: "Settings",
                      fourthIconCircleColor: Colors.brown,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );

  Widget balanceCard() => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          elevation: 2.0,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Balance",
                      style: TextStyle(fontFamily: UIData.ralewayFont),
                    ),
                    Material(
                      color: Colors.black,
                      shape: StadiumBorder(),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "500 Points",
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: UIData.ralewayFont),
                        ),
                      ),
                    )
                  ],
                ),
                Text(
                  "₹ 1000",
                  style: TextStyle(
                      fontFamily: UIData.ralewayFont,
                      fontWeight: FontWeight.w700,
                      color: Colors.green,
                      fontSize: 25.0),
                ),
              ],
            ),
          ),
        ),
      );

  Widget allCards(BuildContext context) => SingleChildScrollView(
        child: Column(
          children: <Widget>[
            appBarColumn(context),
            SizedBox(
              height: deviceSize.height * 0.01,
            ),
            searchCard(),
            SizedBox(
              height: deviceSize.height * 0.01,
            ),
            actionMenuCard(),
            SizedBox(
              height: deviceSize.height * 0.01,
            ),
            balanceCard(),
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          LoginBackground(
            showIcon: false,
          ),
          allCards(context),
        ],
      ),
    );
  }
}
