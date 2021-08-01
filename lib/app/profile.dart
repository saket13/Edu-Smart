import 'package:edusmart/services/authservice.dart';
import 'package:edusmart/services/getprofile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';


// Code for getting the current authenticated user, its an async function so wrappped in the init state, keeping user global
// https://www.youtube.com/watch?v=SmTCmDMi4BY see this video for concept of async/await function and now it is working fine..
// By wrapping the profilegetter() function inside the get user() function as the former would wait for completion of Auth function
// to complete

FirebaseUser user;
Map<String, dynamic> profile = {
        'address': 'default',
        'classes': '',
        'sex': 'M',
        'subjects': '',
        'mobile': 'default',
        'name': 'Please register first !',
        'age': '12',
        'email': 'sam@gmail.com'
      };
var flag = false;
getUser() async {
  user = await FirebaseAuth.instance.currentUser();
  print(user.phoneNumber);

  ProfileGetter().getProfile('${user.phoneNumber}').then((QuerySnapshot docs) {
    if (docs.documents.isNotEmpty) {
      flag = true;
      profile = docs.documents[0].data;
      print(docs.documents[0].data);
    } 
  });

  if (flag == false){
    ProfileGetter().getProfileT('${user.phoneNumber}').then((QuerySnapshot docs) {
    if (docs.documents.isNotEmpty) {
      flag = true;
      profile = docs.documents[0].data;
      print(docs.documents[0].data);
    } 
  });
  }
}

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    getUser();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: new Stack(
      children: <Widget>[
        ClipPath(
          child: Container(color: Color(0xffFF6366)),
          clipper: getClipper(),
        ),
        Positioned(
            width: 400.0,
            top: MediaQuery.of(context).size.height / 5,
            child: Column(
              children: <Widget>[
                Container(
                    width: 150.0,
                    height: 150.0,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        image: DecorationImage(
                            image: new AssetImage(
                              'assets/avatar.png',
                            ),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.all(Radius.circular(75.0)),
                        boxShadow: [
                          BoxShadow(blurRadius: 7.0, color: Color(0xffFF6366))
                        ])),
                SizedBox(height: 55.0),
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
                SizedBox(height: 15.0),        
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.red[500],
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  height: 40,
                  child: Center(
                      child: Text(
                    'Name: ${profile['name']}',
                    style: TextStyle(fontSize: 20.0, fontFamily: 'Quicksand'),
                  )),
                ),
                SizedBox(height: 10.0),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.red[500],
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  height: 40,
                  child: Center(
                      child: Text(
                    'Mobile: ${profile['mobile']}',
                    style: TextStyle(fontSize: 20.0, fontFamily: 'Quicksand'),
                  )),
                ),
                SizedBox(height: 10.0),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.red[500],
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  height: 40,
                  child: Center(
                      child: Text(
                    'Address: ${profile['address']}',
                    style: TextStyle(fontSize: 15.0, fontFamily: 'Quicksand'),
                  )),
                ),
                SizedBox(height: 10.0),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.red[500],
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  height: 40,
                  child: Center(
                      child: Text(
                    'Gender: ${profile['sex']}',
                    style: TextStyle(fontSize: 15.0, fontFamily: 'Quicksand'),
                  )),
                ),
                
              ],
            )),
      ],
    ));
  }
}

class getClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();

    path.lineTo(0.0, size.height / 1.9);
    path.lineTo(size.width + 125, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
}
