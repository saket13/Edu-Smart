import 'package:edusmart/app/profile.dart';
import 'package:flutter/material.dart';
import 'package:edusmart/app/contact.dart';
import 'package:edusmart/app/student_form.dart';
import 'package:edusmart/app/teacher_form.dart';
import 'package:edusmart/services/authservice.dart';
import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:share/share.dart';


class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentPage = 0;
  GlobalKey bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: Colors.white),
        child: Center(
          child: _getPage(currentPage),
        ),
      ), 
      bottomNavigationBar: FancyBottomNavigation(
        tabs: [
          TabData(
              iconData: Icons.home,
              title: "Home",
              onclick: () {
                final FancyBottomNavigationState fState =
                    bottomNavigationKey.currentState;
                fState.setPage(2);
              }),
          TabData(
              iconData: Icons.account_box,
              title: "Account",
              onclick: () => Share.share('Share this app')),
          TabData(iconData: Icons.help, title: "Help")
        ],
        initialSelection: 0,
        circleColor: Color(0xffFF6366),
        inactiveIconColor: Color(0xffFF6366),
        key: bottomNavigationKey,
        onTabChangedListener: (position) {
          setState(() {
            currentPage = position;
          });
        },
      ),
    );
  }
  

  _getPage(int page) {
    switch (page) {
      case 1:
        return ProfilePage();
      case 2:
        return ContactsPage();
      case 0:
        return Scaffold(
          backgroundColor: Color(0xffFF6366),
          body: ListView(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 15.0, left: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.menu),
                      color: Colors.white,
                      onPressed: () {

                      },
                    ),
                    Container(
                        width: 120.0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            RaisedButton(
                              color: Color(0xffFF6366),
                        onPressed: () {
                          AuthService().signOut();
                        },
                        child: Text('Log Out',
                            style: TextStyle(
                                fontFamily: 'Quicksand',
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 15.0)),
                      )
                          ],
                        )),
                  ],
                ),
              ),
              SizedBox(height: 15.0),
              Padding(
                padding: EdgeInsets.only(left: 40.0),
                child: Row(
                  children: <Widget>[
                    Text('Edu',
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 25.0)),
                    SizedBox(width: 5.0),
                    Text('Smart',
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            color: Colors.black,
                            fontSize: 25.0)),
                  ],
                ),
                
              ),
              Padding(
              padding: const EdgeInsets.only(left: 40.0),  
              child: Text('Transforming Education',
                        style: TextStyle(
                            fontFamily: 'Quicksand',
                            color: Colors.black,
                            fontSize: 15.0))),
              SizedBox(height: 20.0),
              Container(
                  height: MediaQuery.of(context).size.height - 190.0,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.only(topLeft: Radius.circular(75.0)),
                  ),
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 30.0),
                      Image.asset(
                        'assets/teacher.jpg',
                        fit: BoxFit.fill,
                        height: 150,
                        width: 150,
                      ),
                      RaisedButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => TeachersPage()));
                        },
                        child: Text('Teacher Registration',
                            style: TextStyle(
                                fontFamily: 'Quicksand',
                                color: Colors.black,
                                fontSize: 15.0)),
                      ),
                      SizedBox(height: 20.0),
                      Image.asset(
                        'assets/student.jpg',
                        fit: BoxFit.fill,
                        height: 135,
                        width: 190,
                      ),
                      RaisedButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => StudentsPage()));
                        },
                        child: Text('Student Registration',
                            style: TextStyle(
                                fontFamily: 'Quicksand',
                                color: Colors.black,
                                fontSize: 15.0)),
                      ),
                    ],
                  )),
            ],
          ),
        );
    }
  }
}
