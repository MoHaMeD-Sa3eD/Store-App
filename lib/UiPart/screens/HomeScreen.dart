import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:store_app_postman/LogicPart/Models/AllProductModel.dart';

import '../../LogicPart/Services/getServices/getAllProductsMethod.dart';
import '../customWidgets/ItemCardWidget.dart';

class HomeScreen extends StatelessWidget {
  static String homeScreenRoute = 'HomeScreenId';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Trend'),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.arrow_back_ios_new_outlined)),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: FaIcon(FontAwesomeIcons.cartShopping),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 60),
        child: FutureBuilder(
          future: AllProductsServices().getAllProductsMethod(),
          builder: (BuildContext context, snapshot) {
            if (snapshot.hasData) {
              List<AllProductsModel> productsList = snapshot.data!;
              return GridView.builder(
                itemCount: productsList.length,
                clipBehavior: Clip.none,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 2,
                    mainAxisSpacing: 30),
                itemBuilder: (BuildContext context, int index) {
                  return ItemCardWidget(
                    allProductsModel: productsList[index],
                  );
                },
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
