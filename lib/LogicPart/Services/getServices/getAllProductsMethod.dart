import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:store_app_postman/LogicPart/Models/AllProductModel.dart';

class AllProductsServices {
  Future<List<AllProductsModel>> getAllProductsMethod({
    @required String? token,
  }) async {
    Map<String, String> headers = {};

    if (token != null) {
      headers.addAll({'Authorization': 'Bearer $token'});
    }

    http.Response response = await http.get(
      Uri.parse(
        'https://fakestoreapi.com/products',
      ),
      headers: headers,
    );

    if (response.statusCode == 200) {
      List<dynamic> decodedResponse = jsonDecode(response.body);
      List<AllProductsModel> allProductsList = [];
      for (var product in decodedResponse) {
        AllProductsModel allProductsModel = AllProductsModel.fromJson(product);
        allProductsList.add(allProductsModel);
      }
      return allProductsList;
    } else {
      throw Exception(
          'an Exception happened in the method: getAllProducts with exception : ${response.statusCode}');
    }
  }
}
