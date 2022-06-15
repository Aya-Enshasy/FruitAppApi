import 'package:flutter/material.dart';
import 'package:fruit_market_app/service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../profile.dart';
import 'products_model.dart';

class ProductSingle extends StatelessWidget{
  var id ;
  ProductSingle(this.id);

  token() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("token");
    print(prefs.getString("token"));
  }
  @override
  Widget build(BuildContext context) {
    print(id);
    return Scaffold(

        appBar: AppBar(
          title: const Text('DETAILS'),
          backgroundColor: const Color.fromRGBO(105, 160, 58, 1),
        ),

        body: SingleChildScrollView(
          padding: const EdgeInsets.only(left: 20),
          child: FutureBuilder<Product>(
            future: Service().getProductDetails(id,token()),
            builder: (context,snapshot)  {
              if(snapshot.hasData){
                print("id");
                return   Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 250,
                      margin: const EdgeInsets.only(top: 30, right: 20),
                      child: Image.network(
                        snapshot.data!.image!,
                        fit: BoxFit.fill,
                        alignment: Alignment.bottomLeft,
                      ),
                    ),
                    Align(
                        alignment: Alignment.bottomLeft,
                        child: Column(
                          children: [
                            Align(
                                alignment: Alignment.bottomLeft,
                                child: Container(
                                  margin: const EdgeInsets.only(bottom: 15, top: 15),
                                  child:  Text(
                                    snapshot.data!.title!,
                                    style: TextStyle(fontSize: 16,fontWeight: FontWeight.w700),
                                  ),
                                )),
                            Container(
                              margin: const EdgeInsets.only(right: 60),
                              child:  Text(
                                snapshot.data!.description!,
                                style: TextStyle(fontSize: 12),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomLeft,
                              child: Container(
                                margin: const EdgeInsets.only(top: 30),
                                child: const Text(
                                  'Nutrition',
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 20),
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.circle,
                                    size: 8,
                                    color: Color.fromRGBO(131, 129, 129, 1),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(left: 10),
                                    child: const Text(
                                      'Fiber',
                                      style: TextStyle(fontSize: 12),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 20),
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.circle,
                                    size: 8,
                                    color: Color.fromRGBO(131, 129, 129, 1),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(left: 10),
                                    child: const Text(
                                      'Potassium',
                                      style: TextStyle(fontSize: 12),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 20),
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.circle,
                                    size: 8,
                                    color: Color.fromRGBO(131, 129, 129, 1),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(left: 10),
                                    child: const Text(
                                      'Iron',
                                      style: TextStyle(fontSize: 12),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 20),
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.circle,
                                    size: 8,
                                    color: Color.fromRGBO(131, 129, 129, 1),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(left: 10),
                                    child: const Text(
                                      'Magnesium',
                                      style: TextStyle(fontSize: 12),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 20),
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.circle,
                                    size: 8,
                                    color: Color.fromRGBO(131, 129, 129, 1),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(left: 10),
                                    child: const Text(
                                      'Vitamin C',
                                      style: TextStyle(fontSize: 12),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 20),
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.circle,
                                    size: 8,
                                    color: Color.fromRGBO(131, 129, 129, 1),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(left: 10),
                                    child: const Text(
                                      'Vitamin K',
                                      style: TextStyle(fontSize: 12),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 20),
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.circle,
                                    size: 8,
                                    color: Color.fromRGBO(131, 129, 129, 1),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(left: 10),
                                    child: const Text(
                                      'Zinc',
                                      style: TextStyle(fontSize: 12),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 20),
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.circle,
                                    size: 8,
                                    color: Color.fromRGBO(131, 129, 129, 1),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(left: 10),
                                    child: const Text(
                                      'Phosphorous',
                                      style: TextStyle(fontSize: 12),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 40,bottom: 10),
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.attach_money,
                                    size: 20,
                                  ),
                                  Text(
                                    snapshot.data!.price.toString(),
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  Expanded(child: Container()),
                                  Container(
                                    margin: const EdgeInsets.only(right: 20),
                                    child: ElevatedButton(
                                      onPressed: () {
                                      },
                                      child: const Center(
                                        child: Text('Buy Now'),
                                      ),
                                      style: ElevatedButton.styleFrom(
                                        primary:
                                        const Color.fromRGBO(105, 160, 58, 1),
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 50, vertical: 15),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ))
                  ],
                );
              }
              else{

                return Center(child: CircularProgressIndicator());

              }
            },

          ),
        )
    );
  }

}
