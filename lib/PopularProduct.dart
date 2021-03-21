import 'package:flutter/material.dart';

import 'API/BaseUrl.dart';
import 'API/GloabalVariable.dart';
import 'Model/Product.dart';
import 'Model/favourite.dart';
import 'constant.dart';
import 'main.dart';
class PopularProduct extends StatefulWidget {
  @override
  _PopularProductState createState() => _PopularProductState();
}

class _PopularProductState extends State<PopularProduct> {

  var click = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                            height: 20,
                            width: 20,
                            child: Image.asset(
                              'assets/ARROW.png',
                            )),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Favourites',
                        style: Textprimary,
                      ),
                      // Spacer(),
                      // Image.asset('assets/Vector.png'),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top:12.0),
                    child: Container(
                      height: MediaQuery.of(context).size.height / 2.2,
                      width: MediaQuery.of(context).size.width,
                      child: wishlistshow.length==0?Container(child: Center(child: Text("No Data To Show")),):
                      GridView.builder(
                        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 200,
                            // childAspectRatio: (itemWidth / itemHeight),
                            crossAxisSpacing: 20,
                            mainAxisSpacing: 20),
                        itemCount: wishlistshow.length,
                        itemBuilder: (BuildContext ctx, index) {
                          return Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Stack(
                                  children: [
                                    Column(
                                      children: [
                                        Container(
                                          height: 100,
                                          width: MediaQuery.of(context)
                                              .size
                                              .width /
                                              2.4,
                                          decoration: BoxDecoration(
                                            color: Greycolor,
                                            borderRadius:
                                            BorderRadius.circular(10),
                                          ),
                                // BaseUrl+wishlistshow[index].image ??
                                          child: Image.network( BaseUrl+wishlistshow[index].image),
                                        ),
                                      ],
                                    ),
                                    InkWell(
                                      // onTap: (){
                                      //   if(!click){
                                      //     click = true;
                                      //     //var contain = wishlist.where((element) => element.id == popularproduct[index].id.toString());
                                      //     //if(contain.isNotEmpty){
                                      //     wishlist.removeWhere((item) => item.id == wishlistshow[index].id.toString());
                                      //      //wishlist.remove(Favourite(id: popularproduct[index].id.toString()));
                                      //
                                      //     final String encodedData =
                                      //     Favourite.encodeMusics(wishlist);
                                      //     MyApp.sharedPreferences.setString("wishlist", encodedData);
                                      //     wishlistshow[index].isFavourite = false;
                                      //     wishlistshow.removeWhere((item) => item.id == wishlistshow[index].id);
                                      //     // wishlistshow.remove(Product(color: popularproduct[index].color ,brand: popularproduct[index].brand,discount: popularproduct[index].discount,id: popularproduct[index].id,
                                      //     //     name: popularproduct[index].name,prices: popularproduct[index].prices,
                                      //     //     image: popularproduct[index].image ,popular: popularproduct[index].popular ,type: popularproduct[index].type));
                                      //     final String encodedData1 =
                                      //     Product.encodeMusics(wishlistshow);
                                      //     MyApp.sharedPreferences.setString("wishlistshow", encodedData1);
                                      //
                                      //     //}
                                      //
                                      //     setState(() {
                                      //
                                      //     });
                                      //
                                      //     click = false;
                                      //   }
                                      //
                                      // },
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 120.0, top: 77),
                                        child: Container(
                                          height: 30,
                                          width: 30,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                            BorderRadius.circular(20),
                                          ),
                                          child: Image.asset(
                                              'assets/fire.png'),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 1.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width:MediaQuery.of(context).size.width/5,
                                        child: Text(
                                          wishlistshow[index].name.toUpperCase(),
                                          style: listtext1,
                                          maxLines: 1,
                                        ),
                                      ),
                                      Text(wishlistshow[index].prices.toUpperCase(),
                                          style:  listtext2),
                                      Text(wishlistshow[index].type==0?"Used".toUpperCase():"New".toUpperCase(),
                                          style:  listtext3),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        )
    );
  }
}
