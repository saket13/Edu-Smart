import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:edusmart/services/authservice.dart';


void main() {
  runApp(new MaterialApp(
    home: new MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
        seconds: 4,
        navigateAfterSeconds: new AfterSplash(),
        image: Image.asset('assets/logo.jpeg'),
        backgroundColor: Color(0xffff5460),
        styleTextUnderTheLoader: new TextStyle(),
        photoSize: 220.0,
        onClick: () => print("Flutter Egypt"),
        loaderColor: Colors.transparent );
  }
}

class AfterSplash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kaveri',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: AuthService().handleAuth(),
    );
  }
}