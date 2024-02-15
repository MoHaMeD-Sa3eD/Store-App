import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AllCategoriesServices {
  Future<List<dynamic>> getAllCategoriesMethod(
    @required String? token,
  ) async {
    Map<String, String> headers = {};

    if (token != null) {
      headers.addAll({'Authorization': 'Bearer $token'});
    }
    http.Response response = await http.get(
      Uri.parse('https://fakestoreapi.com/products/categories'),
      headers: headers,
    );

    if (response.statusCode == 200) {
      List<dynamic> decodedResponse = jsonDecode(response.body);
      return decodedResponse;
    } else {
      throw Exception(
          'an Exception happened in the method: getAllCategories with exception : ${response.statusCode}');
    }
  }
}
