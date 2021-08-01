import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

// Code for getting the current authenticated user, its an async function so wrappped in the init state, keeping user global
FirebaseUser user;
getUser() async {
  user = await FirebaseAuth.instance.currentUser();
  print(user.phoneNumber);
}

class StudentsPage extends StatefulWidget {
  @override
  _StudentsPageState createState() => _StudentsPageState();
}

class _StudentsPageState extends State<StudentsPage> {
  bool autoValidate = true;

  final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();

  // Here init state is responsible for getting authenticated user's phone no
  // just after the widget loads otherwise the null value is passed in database
  @override
  void initState() {
    getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Student's Page"),
        backgroundColor: Color(0xffFF6366),
      ),
      body: Padding(
          padding: const EdgeInsets.all(15),
          child: FormBuilder(
            key: _fbKey,
            autovalidate: true,
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  FormBuilderTextField(
                      attribute: "name",
                      validators: [
                        FormBuilderValidators.min(3),
                        FormBuilderValidators.required()
                      ],
                      decoration: InputDecoration(labelText: "Name")),
                  FormBuilderTextField(
                    attribute: "email",
                    validators: [
                      FormBuilderValidators.email(),
                    ],
                    decoration: InputDecoration(labelText: "Email"),
                  ),
                  FormBuilderTextField(
                    attribute: "address",
                    validators: [
                      FormBuilderValidators.min(3),
                      FormBuilderValidators.required()
                    ],
                    decoration: InputDecoration(labelText: "Address"),
                  ),
                  FormBuilderTextField(
                    attribute: "pin",
                    validators: [
                      FormBuilderValidators.min(6),
                      FormBuilderValidators.required()
                    ],
                    decoration: InputDecoration(labelText: "Zip Code/Pin Code"),
                  ),
                  FormBuilderTextField(
                    attribute: "age",
                    validators: [
                      FormBuilderValidators.min(1),
                      FormBuilderValidators.required()
                    ],
                    decoration: InputDecoration(labelText: "Age"),
                  ),
                  FormBuilderRadioGroup(
                    attribute: 'sex',
                    decoration: const InputDecoration(labelText: 'Gender'),
                    options: [
                      FormBuilderFieldOption(value: 'M', child: Text('Male')),
                      FormBuilderFieldOption(value: 'F', child: Text('Female')),
                    ],
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  FormBuilderFilterChip(
                    decoration: InputDecoration(
                        labelText: 'Subjects Required',
                        labelStyle: TextStyle(
                            fontSize: 21, fontWeight: FontWeight.normal)),
                    attribute: "subjects",
                    options: [
                      FormBuilderFieldOption(
                          child: Text('Maths'), value: "maths"),
                      FormBuilderFieldOption(
                          child: Text('Science'), value: "science"),
                      FormBuilderFieldOption(
                          child: Text('English'), value: "english"),
                      FormBuilderFieldOption(
                          child: Text('Social Studies'),
                          value: "social_science"),
                      FormBuilderFieldOption(
                          child: Text('Sanskrit'), value: "sanskrit"),
                      FormBuilderFieldOption(
                          child: Text('Hindi'), value: "hindi"),
                      FormBuilderFieldOption(
                          child: Text('All Subjects'), value: "all"),
                    ],
                  ),
                  FormBuilderCheckboxGroup(
                    decoration: InputDecoration(labelText: 'Select Class'),
                    attribute: 'classes',
                    options: [
                      FormBuilderFieldOption(value: 'Nursery'),
                      FormBuilderFieldOption(value: 'Class-I'),
                      FormBuilderFieldOption(value: 'Class-II'),
                      FormBuilderFieldOption(value: 'Class-III'),
                      FormBuilderFieldOption(value: 'Class-IV'),
                      FormBuilderFieldOption(value: 'Class-V'),
                      FormBuilderFieldOption(value: 'Class-VI'),
                      FormBuilderFieldOption(value: 'Class-VII'),
                      FormBuilderFieldOption(value: 'Class-VIII'),
                      FormBuilderFieldOption(value: 'Class-IX'),
                      FormBuilderFieldOption(value: 'Class-X'),
                    ],
                  ),
                  FormBuilderTextField(
                    attribute: "board",
                    validators: [
                      FormBuilderValidators.min(0),
                      FormBuilderValidators.required()
                    ],
                    decoration: InputDecoration(
                        labelText: "Enter School Name & Board"),
                  ),
                  FormBuilderTextField(
                    attribute: "marks",
                    validators: [
                      FormBuilderValidators.min(0),
                      FormBuilderValidators.required()
                    ],
                    decoration: InputDecoration(
                        labelText: "Enter Last Percentage/GPA obtained"),
                  ),
                ],
              ),
            ),
          )),
      bottomNavigationBar: Row(
        children: <Widget>[
          Expanded(
            child: MaterialButton(
              color: Colors.redAccent,
              child: Text(
                'Register',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                _showDialog();
                if (_fbKey.currentState.saveAndValidate()) {
                  Firestore.instance
                      .collection('Students')
                      .document(_fbKey.currentState.value['name'])
                      .setData({
                    'mobile': '${user.phoneNumber}',
                    'name': _fbKey.currentState.value['name'],
                    'email': _fbKey.currentState.value['email'],
                    'address': _fbKey.currentState.value['address'],
                    'pin': _fbKey.currentState.value['pin'],
                    'sex': _fbKey.currentState.value['sex'],
                    'age': _fbKey.currentState.value['age'],
                    'classes': _fbKey.currentState.value['classes'],
                    'subjects': _fbKey.currentState.value['subjects'],
                    'board': _fbKey.currentState.value['board'],
                    'marks': _fbKey.currentState.value['marks'],
                  });
                  print(_fbKey.currentState.value);
                } else {
                  print(_fbKey.currentState.value);
                  print('validation failed');
                }
              },
            ),
          ),
          SizedBox(width: 20),
          Expanded(
              child: MaterialButton(
            color: Colors.redAccent,
            child: Text(
              'Reset',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {
              _fbKey.currentState.reset();
            },
          )),
        ],
      ),
    );
  }

  void _showDialog() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Congratulations !"),
          content: new Text("You have been successfully registered ✅"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
