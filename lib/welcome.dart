import 'package:flutter/material.dart';
import 'package:freelance2/API/API.dart';
import 'package:freelance2/API/BaseUrl.dart';
import 'package:freelance2/Model/Product.dart';
import 'package:freelance2/Model/favourite.dart';
import 'package:freelance2/searchonTap.dart';
import 'package:freelance2/shoe.dart';
import 'package:progress_dialog/progress_dialog.dart';

import 'API/GloabalVariable.dart';
import 'Addtochart.dart';
import 'constant.dart';
import 'lists.dart';
import 'main.dart';

class welcome extends StatefulWidget {
  @override
  _welcomeState createState() => _welcomeState();
}

class _welcomeState extends State<welcome> {
  int _selectedIndex = 0;
  ProgressDialog pr;
  void _onItemTapped(int index) {
    _selectedIndex = 0;
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  void initState() {
    pr = ProgressDialog(context);

    // TODO: implement initState
    super.initState();
    // inti();
    //   API.Category();
    //
    //   waittofetch();
  }

  waittofetch(var id,var name) async {
    await Future.delayed(const Duration(seconds: 2), (){
      if(API.complete == 'true'){
        pr.hide();
        print('data updated');
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>
              Shoe(id:id,name:name)),
        );
      }
      else{
        waittofetch(id,name);
      }
    });
  }
  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(18.0),
            child: SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height*2,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top:10.0),
                          child: Text(
                            'Welcome',
                            style: TextStyle(
                              letterSpacing: 1.5,
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                color: Colors.black),
                          ),
                        ),
                        Spacer(),
                        // Image.asset('assets/Vector.png'),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => search()),
                          );
                        },
                      child: Container(
                        height: MediaQuery.of(context).size.height / 13,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Color(0xffF4F4F4),
                          borderRadius: BorderRadius.circular(5),
                        ),

                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Row(
                            children: [
                              Icon(
                                Icons.search,
                                size: 25,
                                color: Colors.black,
                              ),
                              SizedBox(
                                width: 4,
                              ),
                              Text(
                                'Search',
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    color: Colors.grey),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 28,
                    ),
                    Text(
                      'CATEGORIES',
                      style: Textprimary,
                    ),
                    SizedBox(
                      height: 13,
                    ),
                    Container(
                      //color: Colors.grey,
                      height: 57,
                      width: MediaQuery.of(context).size.width / 1.13,
                      child:
                      category.length==0?Container(child: Text("No Data To Show"),):
                      new ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: category.length,
                          itemBuilder: (_, index) {
                            dropdowncat.add(category[index].name);
                            return InkWell(
                              onTap: () {
                                pr.show();
                                API.CategoryProduct(category[index].id);
                                waittofetch(category[index].id,category[index].name);

                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(builder: (context) =>
                                //       Shoe(id:category[index].id,name:category[index].name)),
                                // );

                              },
                              child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 5.0, top: 5, bottom: 6),
                                  child: Container(
                                    height: 63,
                                    width: 179,
                                    decoration: BoxDecoration(

                                      color: Color(0xffE5F3FD),
                                      borderRadius: BorderRadius.circular(9),
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        category[index].picture!="none"?
                                        Image.network(BaseUrl+category[index].picture,height: 30,width: 30,):
                                        Image.asset("assets/bigshoe.png",height: 30,width: 30,)
                                        ,
                                        // Spacer(),
                                        Container(
                                          width: 120,
                                          child: Text(
                                            category[index].name.toUpperCase(),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            //category[index].destination,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),

                                          ),
                                        ),
                                      ],
                                    ),
                                  )),
                            );
                          }),
                    ),
                    SizedBox(
                      height: 26,
                    ),
                    Text('POPULAR ITEMS', style: Textprimary),
                    SizedBox(
                      height: 13,
                    ),
                    SingleChildScrollView(
                      child: Container(
                        height: MediaQuery.of(context).size.height/2,
                        width: MediaQuery.of(context).size.width,
                        child: GridView.builder(
                          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 200,
                              // childAspectRatio: (itemWidth / itemHeight),
                              crossAxisSpacing: 20,
                              mainAxisSpacing: 40),
                          itemCount: popularproduct.length,
                          itemBuilder: (BuildContext ctx, index) {
                            return Container(
                              height:152,
                              width: 154,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Stack(
                                    children: [
                                      Column(
                                        children: [
                                          InkWell(
                                            onTap: (){
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(builder: (context) => addtrochart(favourite: popularproduct[index].isFavourite,
                                                  product: popularproduct[index],)),
                                              );
                                            },
                                            child: Container(
                                              height: 108,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  2.8,
                                              decoration: BoxDecoration(
                                                color: Greycolor,
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child: Image.network(BaseUrl+popularproduct[index].image),
                                            ),
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
                                          child:
                                              InkWell(
                                                onTap: (){
                                                  var contain = wishlist.where((element) => element.id == popularproduct[index].id.toString());
                                                  if(contain.isNotEmpty){
                                                    wishlist.removeWhere((item) => item.id == popularproduct[index].id.toString());
                                                    // wishlist.remove(Favourite(id: popularproduct[index].id.toString()));

                                                    final String encodedData =
                                                    Favourite.encodeMusics(wishlist);
                                                    MyApp.sharedPreferences.setString("wishlist", encodedData);

                                                    wishlistshow.removeWhere((item) => item.id == popularproduct[index].id);
                                                    // wishlistshow.remove(Product(color: popularproduct[index].color ,brand: popularproduct[index].brand,discount: popularproduct[index].discount,id: popularproduct[index].id,
                                                    //     name: popularproduct[index].name,prices: popularproduct[index].prices,
                                                    //     image: popularproduct[index].image ,popular: popularproduct[index].popular ,type: popularproduct[index].type));
                                                    final String encodedData1 =
                                                    Product.encodeMusics(wishlistshow);
                                                    MyApp.sharedPreferences.setString("wishlistshow", encodedData1);
                                                    popularproduct[index].isFavourite = false;
                                                  }
                                                  else {
                                                    wishlist.add(Favourite(
                                                        id: popularproduct[index].id
                                                            .toString()));

                                                    final String encodedData =
                                                    Favourite.encodeMusics(wishlist);
                                                    MyApp.sharedPreferences.setString(
                                                        "wishlist", encodedData);

                                                    wishlistshow.add(Product(
                                                        color: popularproduct[index]
                                                            .color,
                                                        brand: popularproduct[index]
                                                            .brand,
                                                        discount: popularproduct[index]
                                                            .discount,
                                                        id: popularproduct[index].id,
                                                        name: popularproduct[index]
                                                            .name,
                                                        prices: popularproduct[index]
                                                            .prices,
                                                        image: popularproduct[index]
                                                            .image,
                                                        popular: popularproduct[index]
                                                            .popular,
                                                        images: popularproduct[index]
                                                            .images,
                                                        isFavourite: true,
                                                        type: popularproduct[index]
                                                            .type));
                                                    final String encodedData1 =
                                                    Product.encodeMusics(
                                                        wishlistshow);
                                                    MyApp.sharedPreferences.setString(
                                                        "wishlistshow", encodedData1);

                                                    popularproduct[index].isFavourite = true;
                                                  }
                                                  setState(() {

                                                  });


                                                },
                                                child: popularproduct[index].isFavourite ?
                                                Image.asset(
                                                    'assets/fire.png')
                                                    : Image.asset(
                                                    'assets/Vector1.png'),
                                              ),


                                        ),
                                      ),
                                      // Padding(
                                      //   padding: const EdgeInsets.only(top:123.0),
                                      //   child: Column(
                                      //     mainAxisAlignment: MainAxisAlignment.start,
                                      //     crossAxisAlignment: CrossAxisAlignment.start,
                                      //     children: [
                                      //       Text('Air Jordan 1 Dior',style: TextStyle(fontSize: 10),),
                                      //       Text('425 AED',style: TextStyle(fontSize: 10)),
                                      //       Text('Used',style: TextStyle(fontSize: 10)),
                                      //
                                      //     ],
                                      //   ),
                                      // )
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
                                            popularproduct[index].name.toUpperCase(),
                                            style: listtext1,
                                            maxLines: 1,
                                          ),
                                        ),
                                        Text(popularproduct[index].prices+' AED'.toUpperCase(),
                                            style: listtext2),
                                        SizedBox(height: 1,),
                                        Text(popularproduct[index].type==0?"Used".toUpperCase():"New".toUpperCase(),
                                            style: listtext3),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          ),
    );
  }
}
