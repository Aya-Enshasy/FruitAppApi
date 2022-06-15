
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fruit_market_app/loginService.dart';
import 'package:fruit_market_app/login_model.dart';
import 'package:fruit_market_app/service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;


class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final LoginService _login = LoginService();
  bool isLogin = false;
  var scaffold_key = GlobalKey<ScaffoldMessengerState>();
  String? email;
  String? password;
  TextEditingController _emailController=new TextEditingController();
  TextEditingController _passwordController=new TextEditingController();
  late ScaffoldMessengerState scaffoldMessenger ;


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        key: scaffold_key,
        body: Container(
          width: double.infinity,
          height: double.infinity,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                //--------------image-------------------
                Container(
                  width: 221,
                  height: 166,
                  child: Image.asset('assets/PngItem_2746375.png'),
                ),

                //--------------text---------------------
                Container(
                  margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                  child: Text(
                    "Fruit Market",
                    style: TextStyle(
                        color: Color(0xFF69A03A),
                        fontSize: 50,fontWeight: FontWeight.bold),
                  ),
                ),
                //--------------Enter Your Mobile Number---------------------
                Center(
                  child: Container(
                    width: 340,
                    margin: EdgeInsets.fromLTRB(20, 50, 20, 0),
                    child: TextField(
                      controller:_emailController ,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.grey, width: 2.0),
                            borderRadius:
                            BorderRadius.all(Radius.circular(10))),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.grey, width: 2.0),
                            borderRadius:
                            BorderRadius.all(Radius.circular(10))),
                        hintText: 'Enter Your Email',
                      ),
                      onChanged: (inputData){
                        email = inputData;
                      },
                    ),
                  ),
                ),
                Center(

                  child: Container(
                    width: 340,
                    margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
                    child: TextField(
                      controller: _passwordController,
                      onChanged: (inputData){
                        password = inputData;
                      },
                      obscureText: true,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.grey, width: 2.0),
                            borderRadius: BorderRadius.all(
                                Radius.circular(10))),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.grey, width: 2.0),
                            borderRadius: BorderRadius.all(
                                Radius.circular(10))),
                        hintText: 'Enter Your Password',
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    margin: EdgeInsets.fromLTRB(20, 50, 20, 0),
                    width: 370,
                    height: 55,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Container(
                            child: GestureDetector(
                                child: Container(
                                    margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                    decoration: BoxDecoration(
                                      borderRadius:
                                      const BorderRadius.all(
                                        Radius.circular(13),
                                      ),
                                    ),
                                    width: 330,
                                    height: 55,
                                    child: ElevatedButton(
                                      onPressed: () async {
                                        if(_emailController.text.isEmpty||_passwordController.text.isEmpty)
                                        {
                                          scaffoldMessenger.showSnackBar(SnackBar(content:Text("Please Fill all fileds")));
                                          return;
                                        }
                                        UserModel? user = await _login.login(
                                            _emailController.text, _passwordController.text,context);

                                        print('Bearer:${user?.token}');
                                        String token='Bearer:${user?.token}';
                                        //   login(_emailController.text,_passwordController.text);
                                        SharedPreferences shared = await SharedPreferences.getInstance();
                                        shared.setString("email", email!);
                                        shared.setString("password", password!);
                                        shared.setString("token", token);
                                        shared.commit();

                                        var c= shared.get("email");
                                        var c1= shared.get("password");
                                        var c2= shared.get("token");

                                        // print(c2);
                                      },
                                      child: Text('Login'),
                                    ))))
                      ],
                    ),
                  ),
                ),




              ],
            ),
          ),
        ),
      ),
    );
  }

// login1(email,password,context) async
// {
//   Map data = {
//     'username': email,
//     'password': password
//   };
//
//   print(data.toString());
//   final  response= await http.post(
//     Uri.parse("https://fakestoreapi.com/auth/login"),
//
//     body: data,
//
//   )  ;
//
//
//   // String token = await token().getToken();
//   // final response = await http.get(url, headers: {
//   //   'Content-Type': 'application/json',
//   //   'Accept': 'application/json',
//   //   'Authorization': 'Bearer $token',
//   // });
//   // print('Token : ${token}');
//   print(response);
//
//
//   if (response.statusCode == 200) {
//     print("success");
//     // Navigator.push(context,
//     //     MaterialPageRoute(builder: (context) => Products()));
//
//     return response;
//   } else {
//     throw Exception("error");
//   }
//
//
//
// }
}

