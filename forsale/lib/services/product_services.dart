part of 'services.dart';

class ProductServices{

  //setup cloud firestore
  static CollectionReference productCollection = FirebaseFirestore.instance.collection("products");
  static DocumentReference productDocument;


  static Future<bool> addProduct(Products products) async{
    await Firebase.initializeApp();
    String dateNow = AcitivityServices.dateNow();
    productDocument = await productCollection.add({
      'productId' : products.productId,
      'productCategory' : products.productCategory,
      'productInfo' : products.productInfo,
      'productPrice' : products.productPrice,
      'productProfit' : products.productProfit,
      'addBy' : products.addBy,
      'createdAt' : dateNow,
      'updateAt' : dateNow
    });

    return true;
  }

}