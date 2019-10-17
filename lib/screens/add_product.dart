import 'package:armrci/screens/my_style.dart';
import 'package:flutter/material.dart';

class AddProduct extends StatefulWidget {
  @override
  _AddProductState createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
// explicit

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
      onPressed: () {},
    );
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
      child: Image.asset('images/picture.png'),
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
          ),
        ),
      ],
    );
  }

  Widget myContent() {
    return Column(
      children: <Widget>[
        nameText(),
        detailText(),
        picture(),
        pictureButton(),
      ],
    );
  }

  Widget uploadValueButton() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
          child: RaisedButton.icon(
            color: MyStyle().textColor,
            icon: Icon(
              Icons.cloud_upload,
              color: Colors.white,
            ),
            label: Text(
              'Upload Value',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {},
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[uploadValueButton(), myContent()],
    );
  }
}
