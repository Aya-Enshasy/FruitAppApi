import 'dart:convert';

import 'package:flutter/animation.dart';
import 'package:fruit_market_app/loginService.dart';
import 'package:fruit_market_app/login_model.dart';
import 'package:fruit_market_app/products_model.dart';
import 'package:fruit_market_app/profile.dart';
import 'package:fruit_market_app/profile_model.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
class Service  {
  static String _domain = "fakestoreapi.com";
  static String _users = "users/1";

  Future<Product> getProductDetails(int id,dynamic token) async{
    var response = await http.get(Uri.parse("https://fakestoreapi.com/products/$id"));
  if(response.statusCode==200){
    return Product.fromJson(jsonDecode(response.body));

  }else{
    throw Exception("error");
  }
  }
//-----------------------------USER-------------------------------------------
  Future<profile> getUser(dynamic token) async {
    var response = await http.get(Uri.https(_domain, _users));
    if (response.statusCode == 200) {
      return profile.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("error");
    }
  }
  //-----------------------------PRODUCT-------------------------------------------

  Future<List<Product>> getJeweleryProducts(dynamic token) async{
    var responce =  await http.get(Uri.parse("https://fakestoreapi.com/products/category/jewelery"));
    if(responce.statusCode == 200){
      final json = jsonDecode(responce.body);
      final List productList = json;
      return productList.map((item){
        return Product.fromJson(item);
      }).toList();
    }else{
      throw Exception("Error of fetching product");
    }
  }


  Future<List<Product>> getElectronicsProducts(dynamic token) async{
    var responce =  await http.get(Uri.parse("https://fakestoreapi.com/products/category/electronics"));
    if(responce.statusCode == 200){
      final json = jsonDecode(responce.body);
      final List productList = json;
      return productList.map((item){
        return Product.fromJson(item);
      }).toList();
    }else{
      throw Exception("Error of fetching product");
    }
  }

  Future<List<Product>> getMenClothesProducts(dynamic token) async{
    var responce =  await http.get(Uri.parse("https://fakestoreapi.com/products/category/men's%20clothing"));
    if(responce.statusCode == 200){
      final json = jsonDecode(responce.body);
      final List productList = json;
      return productList.map((item){
        return Product.fromJson(item);
      }).toList();
    }else{
      throw Exception("Error of fetching product");
    }
  }


  Future<List<Product>> getWomenClothesProducts(dynamic token) async{
    var responce =  await http.get(Uri.parse("https://fakestoreapi.com/products/category/women's%20clothing"));
    if(responce.statusCode == 200){
      final json = jsonDecode(responce.body);
      final List productList = json;
      return productList.map((item){
        return Product.fromJson(item);
      }).toList();
    }else{
      throw Exception("Error of fetching product");
    }
  }


  // Future<http.Response> login(String email, String password) async {
  //
  //
  //   try {
  //     http.Response response = await http.post(Uri.parse("https://fakestoreapi.com/auth/login"),
  //       body: {
  //         'username': email,
  //         'password': password
  //       },
  //     );
  //     return response;
  //   } on Exception catch (e) {
  //     return throw Exception("error");
  //   }
  // }
  //
  // var loginUri = Uri.parse("https://fakestoreapi.com/auth/login");
  //
  // Future<String?> login1(String username, String password) async {
  //   var res = await http.post(
  //       loginUri,
  //       body: {
  //         "username": username,
  //         "password": password
  //       }
  //   );
  //
  //   if (res.statusCode == 200) {
  //     return  Token().getToken;
  //   } else {
  //     throw Exception("error");
  //   }
  //
  //   // return res;
  // }

//----------------------------------LOGIN--------------------------------------

}


