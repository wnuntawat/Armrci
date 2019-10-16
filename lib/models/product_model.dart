class ProductModel {
  // Field
  String name, detail, pathImage, qrcode;
  // Constructor
  ProductModel(this.name, this.detail, this.pathImage, this.qrcode);
  ProductModel.fromFireStore(Map<String, dynamic> mapFireStore) {
    name = mapFireStore['Name'];
    detail = mapFireStore['Detail'];
    pathImage = mapFireStore['PathImage'];
    qrcode = mapFireStore['QRcode'];
  }
}
