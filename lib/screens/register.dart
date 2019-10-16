import 'package:armrci/screens/my_service.dart';
import 'package:armrci/screens/my_style.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
// Explict
  final formKey = GlobalKey<FormState>();
  String nameString, emailString, passwordString;

// Medthod

  Widget nameText() {
    return TextFormField(
      decoration: InputDecoration(
        icon: Icon(
          Icons.face,
          size: 36.0,
          color: Colors.green[300],
        ),
        labelText: 'Display Name :',
        helperText: 'Type Your Name',
        hintText: 'English Only',
      ),
      onSaved: (value) {
        nameString = value.trim();
      },
    );
  }

  Widget emailText() {
    return TextFormField(
      decoration: InputDecoration(
        icon: Icon(
          Icons.email,
          size: 36.0,
          color: Colors.blue,
        ),
        labelText: 'Email :',
        helperText: 'Type Your Email',
        hintText: 'you@email.com',
      ),
      onSaved: (value) {
        emailString = value.trim();
      },
    );
  }

  Widget passwordText() {
    return TextFormField(
      decoration: InputDecoration(
        icon: Icon(
          Icons.lock,
          size: 36.0,
          color: Colors.yellow,
        ),
        labelText: 'password :',
        helperText: 'Type Your password',
        hintText: 'More 6 Charactor',
      ),
      onSaved: (value) {
        passwordString = value.trim();
      },
    );
  }

  Widget registerButton() {
    return IconButton(
      icon: Icon(Icons.cloud_upload),
      onPressed: () {
        print('You Click Upload');
        formKey.currentState.save();
        print('name=$nameString,email=$emailString,password=$passwordString');
        registerThread();
      },
    );
  }

  Future<void> registerThread() async {
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    await firebaseAuth
        .createUserWithEmailAndPassword(
            email: emailString, password: passwordString)
        .then((response) {
      print('Register Success');
      setUpDisplayName();
    }).catchError((response) {
      String title = response.code;
      String message = response.message;
      print('title=$title,message=$message');
      myAlert(title, message);
    });
  }

  Future<void> setUpDisplayName() async {
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    await firebaseAuth.currentUser().then((response) {
      UserUpdateInfo userUpdateInfo = UserUpdateInfo();
      userUpdateInfo.displayName = nameString;
      response.updateProfile(userUpdateInfo).catchError((response){
        print('error = ===============${response.toString()}');
      });

      MaterialPageRoute materialPageRoute =
          MaterialPageRoute(builder: (BuildContext context) => Myservice());
      Navigator.of(context).pushAndRemoveUntil(
          materialPageRoute, (Route<dynamic> route) => false);
    });
  }

  void myAlert(String title, String message) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(title),
            content: Text(message),
            actions: <Widget>[
              FlatButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyStyle().textColor,
        title: Text('Register'),
        actions: <Widget>[registerButton()],
      ),
      body: Form(
        key: formKey,
        child: ListView(
          padding: EdgeInsets.all(50.0),
          children: <Widget>[
            nameText(),
            emailText(),
            passwordText(),
          ],
        ),
      ),
    );
  }
}
