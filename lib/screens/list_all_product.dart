import 'package:armrci/models/product_model.dart';
import 'package:armrci/screens/my_style.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ListAllProduct extends StatefulWidget {
  @override
  _ListAllProductState createState() => _ListAllProductState();
}

class _ListAllProductState extends State<ListAllProduct> {
  // Explicit
  List<ProductModel> productModels = [];
  // Medthod
  @override
  void initState() {
    super.initState();
    readFireStore();
  }

  Future<void> readFireStore() async {
    Firestore firestore = Firestore.instance;
    CollectionReference collectionReference = firestore.collection('Product');
    await collectionReference.snapshots().listen((response) {
      List<DocumentSnapshot> snapshots = response.documents;
      for (var snapshot in snapshots) {
        print('name = ${snapshot.data['Name']}');

        ProductModel productModel = ProductModel.fromFireStore(snapshot.data);
        setState(() {
          productModels.add(productModel);
        });
      }
    });
  }

  Widget showImage(int index) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.5,
      height: MediaQuery.of(context).size.width * 0.4,
      child: Image.network(productModels[index].pathImage),
    );
  }

  Widget showText(int index) {
    return Container(
      padding: EdgeInsets.all(16.0),
      width: MediaQuery.of(context).size.width * 0.5,
      height: MediaQuery.of(context).size.width * 0.4,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[showName(index),Divider(), showDetailshort(index)],
      ),
    );
  }

  Widget showName(int index) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Text(
          productModels[index].name,
          style: TextStyle(
            color: MyStyle().textColor,
            fontSize: MyStyle().h1,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget showDetailshort(int index) {
    String detail = productModels[index].detail;
    if (detail.length > 50) {
      detail = detail.substring(0, 50);
      detail = '$detail ...';
    }
    return Text(detail);
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: productModels.length,
      itemBuilder: (BuildContext context, int index) {
        return Row(
          children: <Widget>[showImage(index), showText(index)],
        );
      },
    );
  }
}
