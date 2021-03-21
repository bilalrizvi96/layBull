import 'package:flutter/material.dart';
import 'package:freelance2/API/BaseUrl.dart';

import 'API/API.dart';
import 'API/GloabalVariable.dart';
import 'Addtochart.dart';
import 'Model/Product.dart';
import 'Model/favourite.dart';
import 'constant.dart';
import 'lists.dart';
import 'main.dart';

class Shoe extends StatefulWidget {
  var id,name;
  Shoe({this.id,this.name});
  @override
  _ShoeState createState() => _ShoeState();
}

class _ShoeState extends State<Shoe> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // API.CategoryProduct(widget.id);
  }
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
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
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
                          widget.name,
                          style: Textprimary,
                        ),
                        Spacer(),
                        // Image.asset('assets/Vector.png'),
                      ],
                    ),
                  ),
                  SizedBox(height: 10,),
                  Container(
                    height: MediaQuery.of(context).size.height / 2.2,
                    width: MediaQuery.of(context).size.width,
                    child: categoryproduct.length==0?Container(child: Center(child: Text("No Data To Show")),):
                    GridView.builder(
                      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 200,
                          // childAspectRatio: (itemWidth / itemHeight),
                          crossAxisSpacing: 20,
                          mainAxisSpacing: 20),
                      itemCount: categoryproduct.length,
                      itemBuilder: (BuildContext ctx, index) {
                        return Container(
                          child: InkWell(
                            onTap: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => addtrochart(favourite: categoryproduct[index].isFavourite,
                                  product: categoryproduct[index],)),
                              );
                            },
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
                                          child: Image.network(BaseUrl+categoryproduct[index].picture),
                                        ),
                                      ],
                                    ),
                                    Padding(
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
                                        child: InkWell(
                                          onTap: (){
                                            var contain = wishlist.where((element) => element.id.toString() == categoryproduct[index].id.toString());
                                            if(contain.isNotEmpty){
                                              wishlist.removeWhere((item) => item.id == categoryproduct[index].id.toString());
                                              // wishlist.remove(Favourite(id: popularproduct[index].id.toString()));

                                              final String encodedData = Favourite.encodeMusics(wishlist);
                                              MyApp.sharedPreferences.setString("wishlist", encodedData);

                                              wishlistshow.removeWhere((item) => item.id == categoryproduct[index].id);
                                              // wishlistshow.remove(Product(color: popularproduct[index].color ,brand: popularproduct[index].brand,discount: popularproduct[index].discount,id: popularproduct[index].id,
                                              //     name: popularproduct[index].name,prices: popularproduct[index].prices,
                                              //     image: popularproduct[index].image ,popular: popularproduct[index].popular ,type: popularproduct[index].type));
                                              final String encodedData1 =
                                              Product.encodeMusics(wishlistshow);
                                              MyApp.sharedPreferences.setString("wishlistshow", encodedData1);
                                              categoryproduct[index].isFavourite = false;
                                            }
                                            else {
                                              wishlist.add(Favourite(
                                                  id: categoryproduct[index].id
                                                      .toString()));

                                              final String encodedData =
                                              Favourite.encodeMusics(wishlist);
                                              MyApp.sharedPreferences.setString(
                                                  "wishlist", encodedData);

                                              wishlistshow.add(Product(
                                                  // color: categoryproduct[index]
                                                  //     .color,
                                                  brand: categoryproduct[index]
                                                      .brand,
                                                  // discount: categoryproduct[index]
                                                  //     .discount,
                                                  id: categoryproduct[index].id,
                                                  name: categoryproduct[index]
                                                      .name,
                                                  prices: categoryproduct[index]
                                                      .prices,
                                                  image: categoryproduct[index]
                                                      .picture,
                                                  popular: categoryproduct[index]
                                                      .popular,
                                                  images: popularproduct[index]
                                                      .images,
                                                  isFavourite: true,
                                                  type: categoryproduct[index]
                                                      .type));
                                              final String encodedData1 =
                                              Product.encodeMusics(
                                                  wishlistshow);
                                              MyApp.sharedPreferences.setString(
                                                  "wishlistshow", encodedData1);

                                              categoryproduct[index].isFavourite = true;
                                            }
                                            setState(() {

                                            });


                                          },
                                          child: categoryproduct[index].isFavourite ?
                                          Image.asset(
                                              'assets/fire.png')
                                              : Image.asset(
                                              'assets/Vector1.png'),
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
                                      Text(
                                        categoryproduct[index].name.toUpperCase(),
                                        style: listtext1,
                                      ),
                                      Text('AED'+categoryproduct[index].prices.toUpperCase(),
                                          style: listtext2),
                                      SizedBox(height: 1,),
                                      Text(categoryproduct[index].type==0?"Used".toUpperCase():"New".toUpperCase(),
                                          style: listtext3),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      },
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
