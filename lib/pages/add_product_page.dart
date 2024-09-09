import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:footwear_admin/controller/home_controller.dart';
import 'package:footwear_admin/widgets/drop_down_btn.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class AddProductPage extends StatelessWidget {
  const AddProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (ctrl) {
      return Scaffold(
        appBar: AppBar(
          title: null, // Set title to null to avoid the default left alignment
          flexibleSpace: Center(
            child: Text(
              "Add Product",
              style: TextStyle(
                fontSize: 20, // Adjust the font size as needed
                fontWeight: FontWeight.bold, // Optional, adjust the font weight
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(10),
            width: double.maxFinite,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Add New Product",
                  style: TextStyle(fontSize: 30,
                      color: Colors.indigoAccent,
                      fontWeight: FontWeight.bold),),
                TextField(
                  controller: ctrl.productNameCtrl,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)
                      ),
                      label: Text("Product name"),
                      hintText: "Enter your product Name"
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: ctrl.productDescriptionCtrl,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)
                      ),
                      label: Text("Description"),
                      hintText: "Enter your product Description"
                  ),
                  maxLines: 4,
                ),
                SizedBox(height: 10),
                TextField(
                  controller: ctrl.productImgCtrl,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)
                      ),
                      label: Text("Image url"),
                      hintText: "Enter your Image url"
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: ctrl.productPriceCtrl,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)
                      ),
                      label: Text("Product Price"),
                      hintText: "Enter your product Price"
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Flexible(
                        child: DropDownBtn(
                          items: const ['Casual', 'Sports', 'Graphic', 'Polo', 'V-Neck'],
                          selectedItemText: ctrl.category,
                          onSelected: (selectedValue) {
                           ctrl.category = selectedValue ?? 'general';
                           ctrl.update();
                          },
                        )),
                    Flexible(
                        child: DropDownBtn(
                          items: const ['Nike', 'Adidas', 'Puma'],
                          selectedItemText: ctrl.brand,
                          onSelected: (selectedValue) {
                           ctrl.brand = selectedValue ?? 'no brand';
                           ctrl.update();
                          },
                        )),
                  ],
                ),
                SizedBox(height: 10),
                Text("offer Product?"),
                DropDownBtn(
                  items: const ["true", "false"],
                  selectedItemText: ctrl.offer.toString(),
                  onSelected: (selectedValue) {
                   ctrl.offer = bool.tryParse(selectedValue ?? 'false') ?? false;
                   ctrl.update();
                  },),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    ctrl.addProduct();

                  },
                  child: Text("add Product"),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.indigoAccent,
                      foregroundColor: Colors.white
                  ),)


              ],
            ),
          ),
        ),
      );
    });
  }
}
