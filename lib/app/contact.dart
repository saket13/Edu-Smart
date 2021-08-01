import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactsPage extends StatefulWidget {
  @override
  _ContactsPageState createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Contact Us"),
          backgroundColor: Color(0xffFF6366),
        ),
        body: Column(
          children: <Widget>[
            SizedBox(
              height: 10,
            ),
            Center(
                child: Image.asset(
              'assets/contact.png',
              height: 200,
            )),
            Text(
              'If you need help \n feel free to contact us',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: 'Quicksand',
                  fontSize: 15,
                  color: Colors.redAccent),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 100,
                    width: 150,
                    decoration: BoxDecoration(color: Colors.white, boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 20,
                      )
                    ]),
                    child: Column(
                      children: [
                        
                        new IconButton(
                          icon: new Icon(Icons.alternate_email, size: 40.0,),
                          color: Colors.redAccent,                          
                          onPressed: () => launch("mailto:estutorbureau@gmail.com?subject=Need Help"),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          'Write to us',
                          style:
                              TextStyle(fontFamily: 'Quicksand', fontSize: 13),
                        ),
                        Text('estutorbureau@gmail.com',
                            style: TextStyle(
                                fontFamily: 'Quicksand',
                                fontWeight: FontWeight.bold,
                                fontSize: 10)),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 100,
                    width: 150,
                    decoration: BoxDecoration(color: Colors.white, boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 20,
                      )
                    ]),
                    child: Column(
                      children: [
                        

                        new IconButton(
                          icon: new Icon(Icons.help_outline, size: 40.0,),
                          color: Colors.redAccent,                          
                          onPressed: () {},
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        Text('FAQS',
                            style: TextStyle(
                                fontFamily: 'Quicksand', fontSize: 13)),
                        
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 100,
                    width: 150,
                    decoration: BoxDecoration(color: Colors.white, boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 20,
                      )
                    ]),
                    child: Column(
                      children: [
                        
                        
                        new IconButton(
                          icon: new Icon(Icons.phone, size: 40.0,),
                          color: Colors.redAccent,
                          
                          onPressed: () => launch("tel://+918920102544"),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text('+91 9971972314 \n+91 8920102544',
                            style: TextStyle(
                                fontFamily: 'Quicksand',
                                fontWeight: FontWeight.bold,
                                fontSize: 13)),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 100,
                    width: 150,
                    decoration: BoxDecoration(color: Colors.white, boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 20,
                      )
                    ]),
                    child: Column(
                      children: [
                        
                        new IconButton(
                          icon: new Icon(Icons.location_on, size: 40.0,),
                          color: Colors.redAccent,                          
                          onPressed: () {},
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text('Location',
                            style: TextStyle(
                                fontFamily: 'Quicksand', fontSize: 13)),
                        Text('Patna, Daudnagar',
                            style: TextStyle(
                                fontFamily: 'Quicksand',
                                fontWeight: FontWeight.bold,
                                fontSize: 13)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            Text('Copyright © 2020 EduSmart Tutor Bureau',
                style: TextStyle(fontFamily: 'Quicksand', fontSize: 13)),
            Text('All rights reserved',
                style: TextStyle(fontFamily: 'Quicksand', fontSize: 13)),
          ],
        ),
      ),
    );
  }
}
