import 'package:armrci/models/product_model.dart';
import 'package:armrci/screens/my_style.dart';
import 'package:flutter/material.dart';

class Detail extends StatefulWidget {
  final ProductModel productModel;
  Detail({Key key, this.productModel}) : super(key: key);

  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  // explicit
  ProductModel myProductmModel;
  // Method

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    myProductmModel = widget.productModel;
  }

  Widget showName() {
    return Container(
      padding: EdgeInsets.only(left: 30.0, right: 30.0),
      child: Text(
        myProductmModel.name,
        style: TextStyle(
          fontSize: MyStyle().h1,
          color: MyStyle().textColor,
        ),
      ),
    );
  }

  Widget showDetail() {
    return Container(
      padding: EdgeInsets.only(left: 30.0, right: 30.0),
      child: Text(myProductmModel.detail),
    );
  }

  Widget showPicture() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.5,
      padding: EdgeInsets.all(30.0),
      child: Image.network(myProductmModel.pathImage),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail'),
      ),
      body: ListView(
        children: <Widget>[
          showPicture(),
          showName(),
          showDetail(),
        ],
      ),
    );
  }
}
