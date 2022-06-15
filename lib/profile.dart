import 'package:flutter/material.dart';
import 'package:fruit_market_app/login_page.dart';
import 'package:fruit_market_app/profile_model.dart';
import 'package:fruit_market_app/service.dart';
import 'package:shared_preferences/shared_preferences.dart';
class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  List<String> items = [
    "My Orders",
    "Favourites",
    "Settings",
    "My Cart",
    "Rate us",
    "Refer a Friend",
    "Help",
    "Log Out"
  ];
  List<IconData> icons = [
    Icons.shopping_bag,
    Icons.favorite,
    Icons.settings,
    Icons.add_shopping_cart,
    Icons.star_rate,
    Icons.share,
    Icons.help,
    Icons.logout,
  ];


  token() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("token");
    print(prefs.getString("token"));
  }


  @override
  Widget build(BuildContext context) {
    print(token());
    return Scaffold(
      body: Stack(
        children: [
          FutureBuilder<profile>(
              future: Service().getUser(token()),
              builder: (BuildContext context, snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        height: 250,
                        child: Stack(
                          children: [
                            Container(
                              width: double.infinity,
                              padding: const EdgeInsets.only(
                                  left: 20, right: 20, bottom: 90),
                              height: 250,
                              color: const Color.fromRGBO(105, 160, 58, 1),
                              child: Row(
                                children: [
                                  Expanded(child: Container()),
                                  IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.edit,
                                        color: Colors.white,
                                      ))
                                ],
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                margin: const EdgeInsets.only(
                                    left: 25, right: 25, bottom: 80),
                                child:
                                Image.asset(
                                  "assets/Ellipse 421.png",
                                  fit: BoxFit.fitWidth,
                                  alignment: Alignment.bottomLeft,
                                  width: 100,
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                margin: const EdgeInsets.only(
                                    left: 25, right: 25, bottom: 50),
                                child: Text(
                                  snapshot.data!.username!,
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                margin: const EdgeInsets.only(
                                    left: 25, right: 25, bottom: 25),
                                child: Text(
                                  snapshot.data!.email!,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              }),
          Container(
            margin: const EdgeInsets.only(top: 250),
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                return Container(
                  padding: const EdgeInsets.only(bottom: 15),
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Color.fromRGBO(209, 209, 209, 1),
                      ),
                    ),
                  ),
                  margin: const EdgeInsets.only(top: 5, bottom: 20),
                  child: Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 25),
                        child: Icon(
                          icons[index],
                          size: 35,
                          color: const Color.fromRGBO(105, 160, 58, 1),
                        ),
                      ),
                      Container(

                        margin: const EdgeInsets.only(left: 25),
                        child: TextButton(

                          onPressed: () async {
                            SharedPreferences prefs = await SharedPreferences.getInstance();
                            prefs.remove('email');
                            prefs.remove('token');
                            prefs.remove('password');
                            Navigator.pushReplacement(context,
                                MaterialPageRoute(builder: (BuildContext ctx) => LoginPage()));
                          },

                          child: Text(
                            items[index],
                            style: const TextStyle(fontSize: 18),
                          ),

                        ),

                      ),


                    ],
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
