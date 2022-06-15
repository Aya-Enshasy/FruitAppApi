import 'package:flutter/material.dart';
import 'package:fruit_market_app/products.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login_page.dart';


void main() => {runApp(const MyApp())};

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () async {
      SharedPreferences shared = await SharedPreferences.getInstance();
      String? email= shared.getString("email");
      String? password= shared.getString("password");
      String? token= shared.getString("token");
      //
      if(email != null && password != null&& token != null){
        Get.to(Products());
      }else{
        Get.to(LoginPage());
     }
      ;
    });
  }

  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xFF69A03A),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [

                //--------------text---------------------
                Container(
                  margin: EdgeInsets.fromLTRB(0, 350, 0, 0),
                  child: Text(
                    "Fruit Market",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 50,fontWeight: FontWeight.bold),
                  ),
                ),

                //--------------image-------------------
                Image.asset(

                  'assets/mix_fruit_png_11.png',

                  // height: 50.0,

                  width: double.infinity,

                  fit: BoxFit.fitWidth,

                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}