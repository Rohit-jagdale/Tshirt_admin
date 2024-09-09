// import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:footwear_admin/model/product/product.dart';
import 'package:get/get.dart';


class HomeController extends GetxController{

 FirebaseFirestore firestore = FirebaseFirestore.instance;
late CollectionReference productCollection;

TextEditingController productNameCtrl = TextEditingController();
TextEditingController productDescriptionCtrl = TextEditingController();
TextEditingController productImgCtrl = TextEditingController();
TextEditingController productPriceCtrl = TextEditingController();

String category = 'general';
String brand = 'no brand';
bool offer = false ;

 List<Product> products =[];

  @override
  Future<void> onInit() async {
    productCollection = firestore.collection("products");
    await fetchProducts();
    super.onInit();
  }

  addProduct(){
    try {
      DocumentReference doc =  productCollection.doc();
      Product product = Product(
            id: doc.id,
            name: productNameCtrl.text,
            category: category,
            description: productDescriptionCtrl.text,
            price: double.parse(productPriceCtrl.text),
            brand: brand,
            image: productImgCtrl.text,
            offer: offer,
          );
      final productJson = product.toJson();
      doc.set(productJson);
      Get.snackbar("success", "product added successfully", colorText: Colors.green);
      setValuesDefault();
      products.add(product);
    } catch (e) {
      Get.snackbar("error", e.toString(), colorText: Colors.red);
      print(e);
    }
  }

  fetchProducts() async {
    try {
      QuerySnapshot productSnapshot = await productCollection.get();
      final List<Product> retrievedProducts = productSnapshot.docs.map((doc) =>
          Product.fromJson(doc.data() as Map<String, dynamic>)).toList();
      products.clear();
      products.assignAll(retrievedProducts);
      Get.snackbar('success', 'product fetch successfully', colorText: Colors.green);
    } catch (e) {
      Get.snackbar('success', e.toString(), colorText: Colors.red);
      print(e);
    }
    finally {
      update();
    }
  }

  deleteProduct(String id) async {
    try {
      await productCollection.doc(id).delete();
      fetchProducts();
      Get.snackbar('successs', 'product deleted successfully', colorText: Colors.green);
    } catch (e) {
      Get.snackbar("error", e.toString(), colorText: Colors.red);
      print(e);
    } finally{
      update();
    }
  }

  setValuesDefault(){
    productNameCtrl.clear();
    productDescriptionCtrl.clear();
    productImgCtrl.clear();
    productPriceCtrl.clear();

    category = 'general';
    brand = 'no brand';
    offer = false ;
    update();

  }

}