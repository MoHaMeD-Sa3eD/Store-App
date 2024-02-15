import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../Models/AllProductModel.dart';

class GetByCategory {
  Future<List<AllProductsModel>> getProductByCategoryMethod({
    required String categoryName,
    @required String? token,
  }) async {
    Map<String, String> headers = {};

    if (token != null) {
      headers.addAll({'Authorization': 'Bearer $token'});
    }
    http.Response response = await http.get(
      Uri.parse('https://fakestoreapi.com/products/category/$categoryName'),
      headers: headers,
    );

    if (response.statusCode == 200) {
      List<dynamic> decodedResponse = jsonDecode(response.body);
      List<AllProductsModel> productsByCategory = [];
      for (var product in decodedResponse) {
        AllProductsModel allProductsModel = AllProductsModel.fromJson(product);
        productsByCategory.add(allProductsModel);
      }
      return productsByCategory;
    } else {
      throw Exception(
          'an Exception happened in the method: getProductByCategory with exception : ${response.statusCode}');
    }
  }
}
