import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:footwear_admin/model/order/orderr.dart';

class OrderListController extends GetxController{

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  late CollectionReference orderCollection;


  List<Orderr> orders =[];

  @override
  Future<void> onInit() async {
    orderCollection = firestore.collection("orders");
    await fetchOrders();
    super.onInit();
  }


  fetchOrders() async {
    try {
      QuerySnapshot orderSnapshot = await orderCollection.get();
      final List<Orderr> retrievedOrders = orderSnapshot.docs.map((doc) =>
          Orderr.fromJson(doc.data() as Map<String, dynamic>)).toList();
      orders.clear();
      orders.assignAll(retrievedOrders);
      Get.snackbar('success', 'orders fetch successfully', colorText: Colors.green);
    } catch (e) {
      Get.snackbar('success', e.toString(), colorText: Colors.red);
      print(e);
    }
    finally {
      update();
    }
  }

  deleteOrder(String id) async {
    try {
      await orderCollection.doc(id).delete();
      fetchOrders();
      Get.snackbar('successs', 'product deleted successfully', colorText: Colors.green);
    } catch (e) {
      Get.snackbar("error", e.toString(), colorText: Colors.red);
      print(e);
    } finally{
      update();
    }
  }


}