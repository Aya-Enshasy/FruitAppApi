import 'dart:html';

import 'package:flutter/material.dart';
import 'package:fruit_market_app/products.dart';

import 'login_model.dart';
import 'package:dio/dio.dart';

class LoginService {
  @override
  Future<UserModel?> login(String email, String password,BuildContext context) async {
    final api = 'https://fakestoreapi.com/auth/login';
    final data = {"username": email, "password": password};

    final dio = Dio();
    Response response;

    response = await dio.post(api, data: data);
    if (response.statusCode == 200) {

      Navigator.push(context,
          MaterialPageRoute(builder: (context) => Products()));

      final body = response.data;
      return UserModel(email: email, token: body['token']);
    } else {
      return null;
    }
  }
}


