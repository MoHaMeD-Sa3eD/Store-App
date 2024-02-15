import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:store_app_postman/LogicPart/Models/AllProductModel.dart';

class AddProduct {
  Future<AllProductsModel> addProductMethod({
    @required String? token,
    required String title,
    required String price,
    required String description,
    required String image,
    required String category,
  }) async {
    Map<String, String> headers = {};
    if (token != null) {
      headers.addAll({'Authorization': 'Bearer $token'});
    }
    if (token != null || token == null) {
      headers.addAll(
        {
          'Content-Type': 'application/x-www-form-urlencoded',
          'Accept': '*/*',
        },
      );
    }

    http.Response response = await http.post(
      Uri.parse('https://fakestoreapi.com/products'),
      body: {
        'title': title,
        'price': price,
        'description': description,
        'image': image,
        'category': category,
      },
      headers: headers,
    );

    if (response.statusCode == 200) {
      Map decodedResponse = jsonDecode(response.body);
      AllProductsModel allProductsModel =
          AllProductsModel.fromJson(decodedResponse);
      return allProductsModel;
    } else {
      throw Exception(
          'an error happened with the post method with Exception : ${response.statusCode},with body : ${response.body}');
    }
  }
}
