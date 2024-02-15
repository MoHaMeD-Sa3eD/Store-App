import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:store_app_postman/LogicPart/Models/AllProductModel.dart';

class UpdateProduct {
  Future<AllProductsModel> updateProductMethod({
    @required String? token,
    required String title,
    required String price,
    required String description,
    required String image,
    required String category,
    required String id,

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

    http.Response response = await http.put(
      Uri.parse('https://fakestoreapi.com/products/$id'),
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
      print( allProductsModel.id);
      print( allProductsModel.title);
      print( allProductsModel.price);
      print(allProductsModel.description);
      print(allProductsModel.category);
      print(allProductsModel.image);
      return allProductsModel;

    } else {
      throw Exception(
          'an error happened with the post method with Exception : ${response.statusCode},with body : ${response.body}');
    }
  }
}
