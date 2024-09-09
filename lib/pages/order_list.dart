import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:footwear_admin/controller/home_controller.dart';
import 'package:footwear_admin/controller/order_list_controller.dart';
import 'package:footwear_admin/pages/add_product_page.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class OrderList extends StatelessWidget {
  const OrderList({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderListController>(builder: (ctrl) {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            "T-shirts Admin",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: ListView.builder(
            itemCount: ctrl.orders.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(title: Text("Product: ${ctrl.orders[index].item ?? ''}", style: const TextStyle(fontWeight: FontWeight.bold), ),
                  subtitle:  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [Text("Customer name: ${ctrl.orders[index].customer ?? ''}"),
                      Text("Address: ${ctrl.orders[index].address ?? ''}"),
                      Text("Contact: ${(ctrl.orders[index].phone ?? 0).toString()}"),
                      Text("Date: ${ctrl.orders[index].dateTime ?? ''}")
                    ],),
                  trailing: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [Text((ctrl.orders[index].price ?? 0).toString()), Flexible(child: IconButton(onPressed: () {ctrl.deleteOrder(ctrl.orders[index].id ?? '');}, icon: Icon(Icons.delete)))],
                  ),
                ),
              );
            }),
      );
    });
  }
}
