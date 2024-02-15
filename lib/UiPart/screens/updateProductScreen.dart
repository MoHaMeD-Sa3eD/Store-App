import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store_app_postman/LogicPart/Models/AllProductModel.dart';
import 'package:store_app_postman/LogicPart/Services/putServices/updateProductMethod.dart';
import 'package:store_app_postman/UiPart/customWidgets/CustomWidgetsModels/UpdateProductTextFieldModel.dart';

import '../customWidgets/UpdateProducttextField.dart';

class UpdateProductScreen extends StatefulWidget {


  const UpdateProductScreen({
    super.key,
  });

  static String updateProductScreenRoute = 'UpdateProductScreenId';

  @override
  State<UpdateProductScreen> createState() => _UpdateProductScreenState();
}

class _UpdateProductScreenState extends State<UpdateProductScreen> {
  String? productName, description, price, image;
  bool inAsyncCall = false;

  @override
  Widget build(BuildContext context) {
    AllProductsModel productObject =
        ModalRoute.of(context)!.settings.arguments as AllProductsModel;
    return ModalProgressHUD(
      inAsyncCall: inAsyncCall,
      child: Scaffold(

        appBar: AppBar(
          title: const Text('Update Product'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              UpdateProductTextField(
                updateProductTextFieldModel: UpdateProductTextFieldModel(
                  hintText: 'Product Name',
                  onChanged: (data) {
                    productName = data;
                  },
                ),
              ),
              UpdateProductTextField(
                updateProductTextFieldModel: UpdateProductTextFieldModel(
                  hintText: 'description',
                  onChanged: (data) {
                    description = data;
                  },
                ),
              ),
              UpdateProductTextField(
                updateProductTextFieldModel: UpdateProductTextFieldModel(
                  hintText: 'price',
                  onChanged: (data) {
                    price = data;
                  },
                ),
              ),
              UpdateProductTextField(
                updateProductTextFieldModel: UpdateProductTextFieldModel(
                  hintText: 'image',
                  onChanged: (data) {
                    image = data;
                  },
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(2)),
                    minimumSize: const Size(double.infinity, 60)),
                onPressed: () async {
                  await customUpdateProductMethod(productObject, context);
                },
                child: const Text(
                  'Update',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> customUpdateProductMethod(
      AllProductsModel productObject, BuildContext context) async {
    setState(() {
      inAsyncCall = true;
    });
    try {
      await UpdateProduct().updateProductMethod(
        title: productName != null ? productName! : productObject.title,
        price: price != null ? price! : productObject.price.toString(),
        description:
            description != null ? description! : productObject.description,
        image: image != null ? image! : productObject.image,
        category: productObject.category,
        id: productObject.id.toString(),
      );
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('success '),
        ),
      );
      setState(() {
        inAsyncCall = false;
      });
    } catch (e) {
      setState(() {
        inAsyncCall = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('an error happened after clicking the button '),
        ),
      );
      throw Exception('Error with Exception : $e');
    }
  }
}
