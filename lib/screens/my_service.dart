import 'package:armrci/screens/home.dart';
import 'package:armrci/screens/my_style.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Myservice extends StatefulWidget {
  @override
  _MyserviceState createState() => _MyserviceState();
}

class _MyserviceState extends State<Myservice> {
// ExplicitT

// Method

  Widget myDrawer() {
    return Drawer(
      child: ListView(
        children: <Widget>[
          myHeadDrawer(),
          menuShowListProduct(),
          Divider(),
          menuShowAddProduct(),
          Divider(),
        ],
      ),
    );
  }

  Widget menuShowListProduct() {
    return ListTile(
      leading: Icon(
        Icons.filter_1,
        size: 36.0,
        color: Colors.purple,
      ),
      title: Text('List All Product'),
      subtitle: Text('Show all Product in my Factory'),
    );
  }

  Widget menuShowAddProduct() {
    return ListTile(
      leading: Icon(
        Icons.filter_2,
        size: 36.0,
        color: Colors.blue,
      ),
      title: Text('Add Product'),
      subtitle: Text('Show Add Product Page'),
    );
  }

  Widget myHeadDrawer() {
    return DrawerHeader(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/wallpaper.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        children: <Widget>[
          showLogo(),
          showAppName(),
          showLogin(),
        ],
      ),
    );
  }

  Widget showLogo() {
    return Container(
      height: 80.0,
      child: Image.asset('images/logo.png'),
    );
  }

  Widget showAppName() {
    return Text(
      'Royal Can',
      style: TextStyle(
        color: MyStyle().textColor,
        fontSize: MyStyle().h2,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget showLogin() {
    return Text('Login By');
  }

  Widget signOutButton() {
    return IconButton(
      tooltip: 'Sign Out and Back Home',
      icon: Icon(Icons.exit_to_app),
      onPressed: () {
        processSignOut();
      },
    );
  }

  Future<void> processSignOut() async {
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    await firebaseAuth.signOut().then((response) {
      MaterialPageRoute materialPageRoute =
          MaterialPageRoute(builder: (BuildContext context) => Home());
      Navigator.of(context).pushAndRemoveUntil(
          materialPageRoute, (Route<dynamic> route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Service'),
        actions: <Widget>[signOutButton()],
      ),
      body: Text('body'),
      drawer: myDrawer(),
    );
  }
}
