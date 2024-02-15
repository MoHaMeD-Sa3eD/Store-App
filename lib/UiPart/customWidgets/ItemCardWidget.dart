import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:store_app_postman/LogicPart/Models/AllProductModel.dart';
import 'package:store_app_postman/UiPart/screens/updateProductScreen.dart';

class ItemCardWidget extends StatelessWidget {
  final AllProductsModel allProductsModel;

  const ItemCardWidget({
    super.key,
    required this.allProductsModel,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
            context, UpdateProductScreen.updateProductScreenRoute,
            arguments: allProductsModel);
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 15,
                ),
              ],
            ),
            width: MediaQuery.of(context).size.width * 0.45,
            height: MediaQuery.of(context).size.height * 0.18,
            child: Card(
              elevation: 0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          allProductsModel.title.substring(0, 18),
                          textAlign: TextAlign.left,
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text('\$ ${allProductsModel.price}'),
                        IconButton(
                          onPressed: () {},
                          icon: const FaIcon(
                            FontAwesomeIcons.solidHeart,
                            color: Colors.red,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Positioned(
              left: 80,
              bottom: 135,
              right: 30,
              child: Image.network(
                allProductsModel.image,
                height: 100,
                width: 100,
              )),
        ],
      ),
    );
  }
}
