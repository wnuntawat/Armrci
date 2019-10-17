import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddProduct extends StatefulWidget {
  @override
  _AddProductState createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
// explicit
  String name, detail;
  final formKey = GlobalKey<FormState>();
  File file;
// Medthod
  Widget galleryButton() {
    return IconButton(
      icon: Icon(
        Icons.add_photo_alternate,
        size: 48.0,
        color: Colors.green[300],
      ),
      onPressed: () {},
    );
  }

  Widget cameraButton() {
    return IconButton(
      icon: Icon(
        Icons.add_a_photo,
        size: 42.0,
        color: Colors.purple,
      ),
      onPressed: () {
        cameraThread();
      },
    );
  }

  Future<void> cameraThread() async {
    var objFile = await ImagePicker.pickImage(
      maxWidth: 800.0,
      maxHeight: 480.0,
      source: ImageSource.camera,
    );

    setState(() {
     file= objFile; 
    });
  }

  Widget pictureButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width * 0.6,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              cameraButton(),
              galleryButton(),
            ],
          ),
        ),
      ],
    );
  }

  Widget picture() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.4,
      child:
          file == null ? Image.asset('images/picture.png') : Image.file(file),
    );
  }

  Widget detailText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width * 0.6,
          child: TextFormField(
            maxLines: 4,
            keyboardType: TextInputType.multiline,
            decoration: InputDecoration(labelText: 'Detail:'),
            onSaved: (String value) {
              detail = value.trim();
            },
          ),
        ),
      ],
    );
  }

  Widget nameText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width * 0.6,
          child: TextFormField(
            decoration: InputDecoration(labelText: 'Name:'),
            onSaved: (String value) {
              name = value.trim();
            },
          ),
        ),
      ],
    );
  }

  Widget myContent() {
    return Form(
      key: formKey,
      child: Column(
        children: <Widget>[
          nameText(),
          detailText(),
          picture(),
          pictureButton(),
        ],
      ),
    );
  }

  Widget uploadValueButton() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
          child: RaisedButton.icon(
            color: Colors.blue,
            icon: Icon(
              Icons.cloud_upload,
              color: Colors.white,
            ),
            label: Text(
              'Upload Value',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {
              formKey.currentState.save();
              checkValue();
            },
          ),
        ),
      ],
    );
  }

  void checkValue() {
    if ((name.isEmpty) || (detail.isEmpty)) {
      // Have Space
      myAlert('Have Space', 'Please fill All Balnk');
    }
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
    return Stack(
      children: <Widget>[uploadValueButton(), myContent()],
    );
  }
}
