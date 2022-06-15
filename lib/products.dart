import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fruit_market_app/products_model.dart';
import 'package:fruit_market_app/profile.dart';
import 'package:fruit_market_app/service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../ProductSingle.dart';
import 'login_page.dart';

class Products extends StatefulWidget {
  const Products({Key? key}) : super(key: key);

  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  token() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("token");
    print(prefs.getString("token"));
  }

  var market = List.empty(growable: true);
  final TextEditingController _controller = TextEditingController();
  Future<Product>? _futureAlbum;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(

        appBar: AppBar(
          leadingWidth: double.infinity,
          elevation: 0,
          backgroundColor: Color(0xFF69A03A),
          leading: Container(
            margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
            alignment: Alignment.center,
            child: Text(
              'FruitMarket',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          actions: [
           TextButton(
                onPressed :() async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                prefs.remove('email');
                Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (BuildContext ctx) => Profile()));
                },
               child:  Container(
                margin: EdgeInsets.fromLTRB(0, 0, 20, 0),
                alignment: Alignment.center,
                child: Image.asset(
                'assets/Group 2613.png',
                width: 15,
                height: 15,
              ),
            ),),
          ],

        ),

        body: SingleChildScrollView(

          child: Center(
            child: Column(

              children: [

                Container(

                  child: Stack(
                    children: [
                      Container(
                        width: double.infinity,
                        height: 30,
                        color: Color(0xFF69A03A),
                      ),

                      searchBar(),
                    ],
                  ),
                ),

//------------------------Jewelery list --------------------------
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(20, 40, 0, 0),
                      child: Row(

                        children: [
                           FutureBuilder <List<Product>>(
                              future: Service().getJeweleryProducts(token()),
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                 return Text(
                                    snapshot.data![0].category!,
                                    style: TextStyle(color: Color(0xFF000000),fontSize: 16,fontWeight: FontWeight.bold),

                                  );
                                }
                              else{
                                return CircularProgressIndicator();
                                }
    }),

                          Container(
                            padding: EdgeInsets.fromLTRB(10, 0, 0, 0),

                            child: Text(
                              '(20% Off)',
                              style: TextStyle(color: Color(0xFF69A03A),fontSize: 11,fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
//-----------------------Pick up from organic farms-----------------------
                    Container(
                      margin: EdgeInsets.fromLTRB(20, 5, 0, 0),
                      alignment: Alignment.topLeft,
                      child: FutureBuilder <List<Product>>(
                        future: Service().getJeweleryProducts(token()),
                        builder: (context, snapshot) {
                        if (snapshot.hasData) {
                            return Text(
                            snapshot.data![0].description!,
                            style:
                            TextStyle(color: Color(0xFF000000), fontSize: 10),
                            );
                            }
                        else{
                          return CircularProgressIndicator();
                        }
    }
                      ),),
                  ],
                ),
                Container(

                    width: double.infinity,
                    height: 270,
                          child: FutureBuilder <List<Product>>(
                          future: Service().getJeweleryProducts(token()),
                          builder: (context, snapshot) {
                          if (snapshot.hasData) {
                          return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: snapshot.data!.length,
                          itemBuilder: (BuildContext context, int index) {

                            return Container(

                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Stack(

                                    children: [

                                      Padding(
                                        padding: EdgeInsets.fromLTRB(20, 16, 0, 0),
                                        child: Image.network(
                                          snapshot.data![index].image!,
                                          fit: BoxFit.fill,
                                          width: 100,
                                          height: 140,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.fromLTRB(103, 22, 0, 0),
                                        child: Container(

                                          width: 30,
                                          height: 30,
                                          child: Image.asset(
                                            "assets/heart.png",
                                          ),
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.all(Radius.circular(50)),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(

                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                                margin: EdgeInsets.fromLTRB(20, 8, 0, 0),
                                                child:Icon(
                                                  Icons.star,
                                                  size: 15,
                                                  color: Color.fromRGBO(
                                                      253, 209, 0, 1.0),
                                                )),

                                            Container(
                                                margin: EdgeInsets.fromLTRB(3, 8, 0, 0),
                                                child: Text(
                                                  snapshot.data![index].rating!.rate!.toString(),
                                                  style:TextStyle(color: Color(0xFF000000), fontSize: 10,fontWeight: FontWeight.bold),
                                                )),
                                          ],
                                        ),

                                        Container(
                                          margin: EdgeInsets.fromLTRB(15, 0, 0, 0),
                                          width: 100,
                                          child: TextButton(
                                            onPressed: () {
                                              print(snapshot.data![index].id);
                                              Navigator.push(context,
                                                  MaterialPageRoute(builder: (context) => ProductSingle(snapshot.data![index].id)));
                                            },
                                            child: Text(
                                              snapshot.data![index].title!,
                                              style: TextStyle(
                                                color: Color(0xFF393939),
                                                fontSize: 10,

                                              ),
                                            ),
                                          ),
                                        ),

                                        Container(
                                          margin: EdgeInsets.fromLTRB(20, 8, 0, 0),
                                          child: Row(
                                            children: [
                                              Container(
                                                width: 6,
                                                height: 10,
                                                child: Image.asset('assets/Path 1.png'),
                                              ),
                                              Container(
                                                padding: EdgeInsets.fromLTRB(6, 0, 0, 0),
                                                child: Text(
                                                  snapshot.data![index].price!.toString(),
                                                  style: TextStyle(
                                                      fontSize: 12, fontWeight: FontWeight.w500),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                ],
                              ),
                            );
                          },
                          );
                          }else{
                            print("else");
                            return Center(child: CircularProgressIndicator());
                          }
                          }
                          )
                ),


//--------------------Electronics------------------------------
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(20, 30, 0, 0),
                      child: Row(

                        children: [
                          FutureBuilder <List<Product>>(
                              future: Service().getElectronicsProducts(token()),
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  return Text(
                                    snapshot.data![1].category!,
                                    style: TextStyle(color: Color(0xFF000000),fontSize: 16,fontWeight: FontWeight.bold),

                                  );
                                }
                                else{
                                  return CircularProgressIndicator();
                                }
                              }),

                          Container(
                            padding: EdgeInsets.fromLTRB(10, 0, 0, 0),

                            child: Text(
                              '(20% Off)',
                              style: TextStyle(color: Color(0xFF69A03A),fontSize: 11,fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(20, 5, 0, 0),
                      alignment: Alignment.topLeft,
                      child: FutureBuilder <List<Product>>(
                          future: Service().getJeweleryProducts(token()),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return Text(
                                snapshot.data![1].description!,
                                style:
                                TextStyle(color: Color(0xFF000000), fontSize: 10),
                              );
                            }
                            else{
                              return CircularProgressIndicator();
                            }
                          }
                      ),),
                  ],
                ),
                Container(

                    width: double.infinity,
                    height: 285,
                    child: FutureBuilder <List<Product>>(
                        future: Service().getElectronicsProducts(token()),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: snapshot.data!.length,
                              itemBuilder: (BuildContext context, int index) {

                                return Container(

                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Stack(

                                        children: [

                                          Padding(
                                            padding: EdgeInsets.fromLTRB(20, 16, 0, 0),
                                            child: Image.network(
                                              snapshot.data![index].image!,
                                              fit: BoxFit.fill,
                                              width: 100,
                                              height: 140,
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.fromLTRB(103, 22, 0, 0),
                                            child: Container(

                                              width: 30,
                                              height: 30,
                                              child: Image.asset(
                                                "assets/heart.png",
                                              ),
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.all(Radius.circular(50)),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Container(

                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Container(
                                                    margin: EdgeInsets.fromLTRB(20, 8, 0, 0),
                                                    child:Icon(
                                                      Icons.star,
                                                      size: 15,
                                                      color: Color.fromRGBO(
                                                          253, 209, 0, 1.0),
                                                    )),

                                                Container(
                                                    margin: EdgeInsets.fromLTRB(3, 8, 0, 0),
                                                    child: Text(
                                                      snapshot.data![index].rating!.rate!.toString(),
                                                      style:TextStyle(color: Color(0xFF000000), fontSize: 10,fontWeight: FontWeight.bold),
                                                    )),
                                              ],
                                            ),

                                            Container(
                                              margin: EdgeInsets.fromLTRB(15, 0, 0, 0),
                                              width: 100,
                                              child: TextButton(
                                                onPressed: () {
                                                  print(snapshot.data![index].id);
                                                  Navigator.push(context,
                                                      MaterialPageRoute(builder: (context) => ProductSingle(snapshot.data![index].id)));
                                                },
                                                child: Text(
                                                  snapshot.data![index].title!,
                                                  style: TextStyle(
                                                    color: Color(0xFF393939),
                                                    fontSize: 10,

                                                  ),
                                                ),
                                              ),
                                            ),

                                            Container(
                                              margin: EdgeInsets.fromLTRB(20, 8, 0, 0),
                                              child: Row(
                                                children: [
                                                  Container(
                                                    width: 6,
                                                    height: 10,
                                                    child: Image.asset('assets/Path 1.png'),
                                                  ),
                                                  Container(
                                                    padding: EdgeInsets.fromLTRB(6, 0, 0, 0),
                                                    child: Text(
                                                      snapshot.data![index].price!.toString(),
                                                      style: TextStyle(
                                                          fontSize: 12, fontWeight: FontWeight.w500),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),

                                    ],
                                  ),
                                );
                              },
                            );
                          }else{
                            print("else");
                            return Center(child: CircularProgressIndicator());
                          }
                        }
                    )
                ),

//---------------------MenClothes------------------------------
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(20, 10, 0, 0),
                      child: Row(

                        children: [
                          FutureBuilder <List<Product>>(
                              future: Service().getMenClothesProducts(token()),
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  return Text(
                                    snapshot.data![2].category!,
                                    style: TextStyle(color: Color(0xFF000000),fontSize: 16,fontWeight: FontWeight.bold),

                                  );
                                }
                                else{
                                  return CircularProgressIndicator();
                                }
                              }),

                          Container(
                            padding: EdgeInsets.fromLTRB(10, 0, 0, 0),

                            child: Text(
                              '(20% Off)',
                              style: TextStyle(color: Color(0xFF69A03A),fontSize: 11,fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(20, 5, 0, 0),
                      alignment: Alignment.topLeft,
                      child: FutureBuilder <List<Product>>(
                          future: Service().getMenClothesProducts(token()),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return Text(
                                snapshot.data![2].description!,
                                style:
                                TextStyle(color: Color(0xFF000000), fontSize: 10),
                              );
                            }
                            else{
                              return CircularProgressIndicator();
                            }
                          }
                      ),),
                  ],
                ),
                Container(

                    width: double.infinity,
                    height: 250,
                    child: FutureBuilder <List<Product>>(
                        future: Service().getMenClothesProducts(token()),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: snapshot.data!.length,
                              itemBuilder: (BuildContext context, int index) {

                                return Container(

                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Stack(

                                        children: [

                                          Padding(
                                            padding: EdgeInsets.fromLTRB(20, 16, 0, 0),
                                            child: Image.network(
                                              snapshot.data![index].image!,
                                              fit: BoxFit.fill,
                                              width: 100,
                                              height: 140,
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.fromLTRB(103, 22, 0, 0),
                                            child: Container(

                                              width: 30,
                                              height: 30,
                                              child: Image.asset(
                                                "assets/heart.png",
                                              ),
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.all(Radius.circular(50)),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Container(

                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Container(
                                                    margin: EdgeInsets.fromLTRB(20, 8, 0, 0),
                                                    child:Icon(
                                                      Icons.star,
                                                      size: 15,
                                                      color: Color.fromRGBO(
                                                          253, 209, 0, 1.0),
                                                    )),

                                                Container(
                                                    margin: EdgeInsets.fromLTRB(3, 8, 0, 0),
                                                    child: Text(
                                                      snapshot.data![index].rating!.rate!.toString(),
                                                      style:TextStyle(color: Color(0xFF000000), fontSize: 10,fontWeight: FontWeight.bold),
                                                    )),
                                              ],
                                            ),

                                            Container(
                                              margin: EdgeInsets.fromLTRB(15, 0, 0, 0),
                                              width: 100,
                                              child: TextButton(
                                                onPressed: () {
                                                  print(snapshot.data![index].id);
                                                  Navigator.push(context,
                                                      MaterialPageRoute(builder: (context) => ProductSingle(snapshot.data![index].id)));
                                                },
                                                child: Text(
                                                  snapshot.data![index].title!,
                                                  style: TextStyle(
                                                    color: Color(0xFF393939),
                                                    fontSize: 10,

                                                  ),
                                                ),
                                              ),
                                            ),

                                            Container(
                                              margin: EdgeInsets.fromLTRB(20, 8, 0, 0),
                                              child: Row(
                                                children: [
                                                  Container(
                                                    width: 6,
                                                    height: 10,
                                                    child: Image.asset('assets/Path 1.png'),
                                                  ),
                                                  Container(
                                                    padding: EdgeInsets.fromLTRB(6, 0, 0, 0),
                                                    child: Text(
                                                      snapshot.data![index].price!.toString(),
                                                      style: TextStyle(
                                                          fontSize: 12, fontWeight: FontWeight.w500),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),

                                    ],
                                  ),
                                );
                              },
                            );
                          }else{
                            print("else");
                            return Center(child: CircularProgressIndicator());
                          }
                        }
                    )
                ),

//--------------------WomenClothes-------------------
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(20, 40, 0, 0),
                      child: Row(

                        children: [
                          FutureBuilder <List<Product>>(
                              future: Service().getWomenClothesProducts(token()),
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  return Text(
                                    snapshot.data![3].category!,
                                    style: TextStyle(color: Color(0xFF000000),fontSize: 16,fontWeight: FontWeight.bold),

                                  );
                                }
                                else{
                                  return CircularProgressIndicator();
                                }
                              }),

                          Container(
                            padding: EdgeInsets.fromLTRB(10, 0, 0, 0),

                            child: Text(
                              '(20% Off)',
                              style: TextStyle(color: Color(0xFF69A03A),fontSize: 11,fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(20, 5, 0, 0),
                      alignment: Alignment.topLeft,
                      child: FutureBuilder <List<Product>>(
                          future: Service().getWomenClothesProducts(token()),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return Text(
                                snapshot.data![3].description!,
                                style:
                                TextStyle(color: Color(0xFF000000), fontSize: 10),
                              );
                            }
                            else{
                              return CircularProgressIndicator();
                            }
                          }
                      ),),
                  ],
                ),
                Container(

                    width: double.infinity,
                    height: 285,
                    child: FutureBuilder <List<Product>>(
                        future: Service().getWomenClothesProducts(token()),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: snapshot.data!.length,
                              itemBuilder: (BuildContext context, int index) {

                                return Container(

                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Stack(

                                        children: [

                                          Padding(
                                            padding: EdgeInsets.fromLTRB(20, 16, 0, 0),
                                            child: Image.network(
                                              snapshot.data![index].image!,
                                              fit: BoxFit.fill,
                                              width: 100,
                                              height: 140,
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.fromLTRB(103, 22, 0, 0),
                                            child: Container(

                                              width: 30,
                                              height: 30,
                                              child: Image.asset(
                                                "assets/heart.png",
                                              ),
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.all(Radius.circular(50)),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Container(

                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Container(
                                                    margin: EdgeInsets.fromLTRB(20, 8, 0, 0),
                                                    child:Icon(
                                                      Icons.star,
                                                      size: 15,
                                                      color: Color.fromRGBO(
                                                          253, 209, 0, 1.0),
                                                    )),

                                                Container(
                                                    margin: EdgeInsets.fromLTRB(3, 8, 0, 0),
                                                    child: Text(
                                                      snapshot.data![index].rating!.rate!.toString(),
                                                      style:TextStyle(color: Color(0xFF000000), fontSize: 10,fontWeight: FontWeight.bold),
                                                    )),
                                              ],
                                            ),

                                            Container(
                                              margin: EdgeInsets.fromLTRB(15, 0, 0, 0),
                                              width: 100,
                                              child: TextButton(
                                                onPressed: () {
                                                  print(snapshot.data![index].id);
                                                  Navigator.push(context,
                                                      MaterialPageRoute(builder: (context) => ProductSingle(snapshot.data![index].id)));
                                                },
                                                child: Text(
                                                  snapshot.data![index].title!,
                                                  style: TextStyle(
                                                    color: Color(0xFF393939),
                                                    fontSize: 10,

                                                  ),
                                                ),
                                              ),
                                            ),

                                            Container(
                                              margin: EdgeInsets.fromLTRB(20, 8, 0, 0),
                                              child: Row(
                                                children: [
                                                  Container(
                                                    width: 6,
                                                    height: 10,
                                                    child: Image.asset('assets/Path 1.png'),
                                                  ),
                                                  Container(
                                                    padding: EdgeInsets.fromLTRB(6, 0, 0, 0),
                                                    child: Text(
                                                      snapshot.data![index].price!.toString(),
                                                      style: TextStyle(
                                                          fontSize: 12, fontWeight: FontWeight.w500),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),

                                    ],
                                  ),
                                );
                              },
                            );
                          }else{
                            print("else");
                            return Center(child: CircularProgressIndicator());
                          }
                        }
                    )
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  Widget searchBar() {
    return Container(
      margin: EdgeInsets.fromLTRB(15,0,15,15),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 15,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(6)),
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: "Search",
          border: InputBorder.none,
          prefixIcon: Icon(Icons.search,color: Color(0xFFC3C3C3),),
        ), ),
    );
  }


}