import 'package:flutter/material.dart';
import 'package:freelance2/API/BaseUrl.dart';

import 'API/GloabalVariable.dart';
import 'Addtochart.dart';
import 'constant.dart';
import 'lists.dart';

class selling extends StatefulWidget {
  @override
  _sellingState createState() => _sellingState();
}

class _sellingState extends State<selling> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(18.0),
            child: SingleChildScrollView(

              child: Container(
                height: MediaQuery.of(context).size.height*1.1,
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
                          'SELLING',
                          style: Textprimary,
                        ),
                        // Spacer(),
                        // Image.asset('assets/Vector.png'),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top:12.0),
                      child: Container(
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => addtrochart()),
                              );
                            },
                          child: GridView.builder(
                            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                                maxCrossAxisExtent: 200,
                                // childAspectRatio: (itemWidth / itemHeight),
                                crossAxisSpacing: 20,
                                mainAxisSpacing: 20),
                            itemCount: userproduct.length,
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
                                              child: Image.network(
                                                  BaseUrl+userproduct[index].image),
                                            ),
                                          ],
                                        ),
                                        // Padding(
                                        //   padding: const EdgeInsets.only(
                                        //       left: 120.0, top: 77),
                                        //   child: Container(
                                        //     height: 30,
                                        //     width: 30,
                                        //     decoration: BoxDecoration(
                                        //       color: Colors.white,
                                        //       borderRadius:
                                        //       BorderRadius.circular(20),
                                        //     ),
                                        //     child: Image.asset(
                                        //         'assets/fire.png'),
                                        //   ),
                                        // ),
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
                                            child: Text(userproduct[index].name.toUpperCase(),
                                              style:  listtext1,
                                              maxLines: 1,
                                            ),
                                          ),
                                          Text(userproduct[index].prices.toUpperCase()+"AED", style:  listtext2),
                                          SizedBox(height: 1,),
                                          Text(userproduct[index].type==0?"Used".toUpperCase():"New".toUpperCase(), style: listtext3),
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
                    )
                  ],
                ),
              ),
            ),
          ),

      ),
    );
  }
}

