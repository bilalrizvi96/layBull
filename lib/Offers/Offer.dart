import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:freelance2/API/BaseUrl.dart';
import 'package:freelance2/API/GloabalVariable.dart';
import 'package:freelance2/AddProduct/addproduct.dart';
import 'package:freelance2/Cart/Cart.dart';
import 'package:freelance2/constant.dart';

class offer extends StatefulWidget {
  @override
  _offerState createState() => _offerState();
}

class _offerState extends State<offer> {
  bool sentvisible = true;
  bool recevied = false ;
  Color colors = Colors.black;
  Color color = Colors.grey[100];

@override
  void initState() {
    // TODO: implement initState
   sentvisible = true;
   recevied = false ;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(left: 10,right: 10, top: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text("OFFERS", style: Textprimary,),
                SizedBox(height: 15,),
                Row(
                  children: [
                    InkWell(
                      onTap: (){
                        setState(() {
                          if(sentvisible != true)
                            {
                              colors = Colors.black;
                              sentvisible = true;
                              recevied = false;
                              setState(() {
                                color = Color(0xFFE5E5E5);
                              });
                            }
                        });
                      },
                      child: Container(
                        height: 40,
                          width: MediaQuery.of(context).size.width/2.2,
                          decoration: BoxDecoration(
                              color: colors,
                            borderRadius: BorderRadius.circular(10)
                          ),
                          child: Center(child: Text("Sent", style: TextStyle(color: Color(0xFFB3B3B3),fontWeight: FontWeight.bold),))
                      ),
                    ),
                    Spacer(),
                    InkWell(
                      onTap: (){
                        setState(() {
                          if(recevied != true)
                          {
                            color = Colors.black;
                            colors = Color(0xFFE5E5E5);
                            recevied = true;
                            sentvisible = false;

                          }
                        });
                      },
                      child: Container(
                        height: 40,
                          width: MediaQuery.of(context).size.width/2.2,
                          decoration: BoxDecoration(
                              color: color,
                              borderRadius: BorderRadius.circular(10)

                          ),
                          child: Center(child: Text("Received", style: TextStyle(color:  Color(0xFFB3B3B3),fontWeight: FontWeight.bold),))
                      ),
                    ),

                  ],
                ),
                Visibility(
                  visible: sentvisible ,
                  child: Column(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height/1.4,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10,),
                          child: ListView.builder(
                              itemCount: sentOffer.length,
                              itemBuilder: (BuildContext ctct, int index){

                            return Container(
                              height: 130,
                              decoration: BoxDecoration(
                                  color: Color(0xffF4F4F4),
                                  borderRadius: BorderRadius.circular(10)
                              ),
                              child: Row(
                                children: [
                                  Container(
                                      width: 120,
                                      child: Image.network(BaseUrl + sentOffer[index].images[0], fit: BoxFit.fill,)
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(height: 10,),
                                      Text(sentOffer[index].name.toUpperCase(), style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),),
                                      SizedBox(height: 8,),
                                      Text(sentOffer[index].type==0?"Used |".toUpperCase():"New |".toUpperCase() +sentOffer[index].size.toString(), style: TextStyle(color: Colors.grey),),
                                      SizedBox(height: 8,),
                                      Text("AED "+sentOffer[index].prices.toString().toUpperCase(), style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),),
                                      SizedBox(height: 8,),
                                      InkWell(
                                        onTap: (){
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (_) => Cart()));
                                        },
                                        child: Container(
                                          height: 30,
                                          width: 100,
                                          decoration: BoxDecoration(
                                              color: Colors.green,
                                              borderRadius: BorderRadius.circular(5)
                                          ),
                                          child:  Center(child: Text("Accepted", style: TextStyle(color: Colors.white),)),
                                        ),
                                      )
                                    ],
                                  )

                                ],
                              ),
                            );
                          })
                        ),
                      ),
                      SizedBox(height: 50,),
                    ],
                  ),
                ),
                Visibility(
                  visible: recevied,
                  child:  Container(
                    height: MediaQuery.of(context).size.height/1.4,
                    child: ListView.builder(
                        itemCount: recivedorder.length,
                        itemBuilder: (BuildContext ctxt, int index) {
                          return Container(
                            height: 130,
                            decoration: BoxDecoration(
                                color: Color(0xffF4F4F4),
                                borderRadius: BorderRadius.circular(10)
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                        width: 120,
                                        child: Image.asset("assets/image 3.png", fit: BoxFit.fill,)
                                    ),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(height: 10,),
                                        Text(recivedorder[index].name, style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),),
                                        SizedBox(height: 8,),
                                        Text(recivedorder[index].type==0?"Used |":"New |" + recivedorder[index].size, style: TextStyle(color: Color(0xffB0B0B0)),),
                                        SizedBox(height: 8,),
                                        Text("AED "+recivedorder[index].prices.toString(), style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),),

                                      ],
                                    )

                                  ],
                                ),
                                SizedBox(height: 10,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                      height: 30,
                                      width: 120,
                                      decoration: BoxDecoration(
                                          color: Colors.black,
                                          borderRadius: BorderRadius.circular(3)
                                      ),
                                      child:  Center(child: Text("COUNTER OFFER", style: TextStyle(color: Colors.white, fontSize: 9),)),
                                    ),
                                    Container(
                                      height: 30,
                                      width: 100,
                                      decoration: BoxDecoration(
                                          border: Border.all(color: Colors.green),
                                          borderRadius: BorderRadius.circular(3)
                                      ),
                                      child:  Center(child: Text("Accept", style: TextStyle(color: Colors.green,fontSize: 10),)),
                                    ),
                                    Container(
                                      height: 30,
                                      width: 100,
                                      decoration: BoxDecoration(
                                          border: Border.all(color: Colors.red),
                                          borderRadius: BorderRadius.circular(3)
                                      ),
                                      child:  Center(child: Text("REJECT", style: TextStyle(color: Colors.red , fontSize: 10),)),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          );
                          SizedBox(height: 10,);
                        }),
                  ),


                  // Expanded(
                  //   child: Padding(
                  //     padding: const EdgeInsets.only(top: 10),
                  //     child:  Column(
                  //       children: [
                  //         Container(
                  //           height: 130,
                  //           decoration: BoxDecoration(
                  //               color: Color(0xffF4F4F4),
                  //               borderRadius: BorderRadius.circular(10)
                  //           ),
                  //           child: Column(
                  //             crossAxisAlignment: CrossAxisAlignment.start,
                  //             children: [
                  //               Row(
                  //                 children: [
                  //                   Container(
                  //                       width: 120,
                  //                       child: Image.asset("assets/image 3.png", fit: BoxFit.fill,)
                  //                   ),
                  //                   Column(
                  //                     mainAxisAlignment: MainAxisAlignment.start,
                  //                     crossAxisAlignment: CrossAxisAlignment.start,
                  //                     children: [
                  //                       SizedBox(height: 10,),
                  //                       Text("Yeezy Boost 350", style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),),
                  //                       SizedBox(height: 8,),
                  //                       Text("Used | US11", style: TextStyle(color: Color(0xffB0B0B0)),),
                  //                       SizedBox(height: 8,),
                  //                       Text("AED 500", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),),
                  //
                  //                     ],
                  //                   )
                  //
                  //                 ],
                  //               ),
                  //               SizedBox(height: 10,),
                  //               Row(
                  //                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //                 children: [
                  //                   Container(
                  //                     height: 30,
                  //                     width: 120,
                  //                     decoration: BoxDecoration(
                  //                         color: Colors.black,
                  //                         borderRadius: BorderRadius.circular(3)
                  //                     ),
                  //                     child:  Center(child: Text("COUNTER OFFER", style: TextStyle(color: Colors.white, fontSize: 9),)),
                  //                   ),
                  //                   Container(
                  //                     height: 30,
                  //                     width: 100,
                  //                     decoration: BoxDecoration(
                  //                         border: Border.all(color: Colors.green),
                  //                         borderRadius: BorderRadius.circular(3)
                  //                     ),
                  //                     child:  Center(child: Text("Accept", style: TextStyle(color: Colors.green,fontSize: 10),)),
                  //                   ),
                  //                   Container(
                  //                     height: 30,
                  //                     width: 100,
                  //                     decoration: BoxDecoration(
                  //                         border: Border.all(color: Colors.red),
                  //                         borderRadius: BorderRadius.circular(3)
                  //                     ),
                  //                     child:  Center(child: Text("REJECT", style: TextStyle(color: Colors.red , fontSize: 10),)),
                  //                   ),
                  //                 ],
                  //               )
                  //             ],
                  //           ),
                  //         ),
                  //         SizedBox(height: 10,),
                  //         Container(
                  //           height: 130,
                  //           decoration: BoxDecoration(
                  //               color: Color(0xffF4F4F4),
                  //               borderRadius: BorderRadius.circular(10)
                  //           ),
                  //           child: Column(
                  //             crossAxisAlignment: CrossAxisAlignment.start,
                  //             children: [
                  //               Row(
                  //                 children: [
                  //                   Container(
                  //                       width: 120,
                  //                       child: Image.asset("assets/image 3.png", fit: BoxFit.fill,)
                  //                   ),
                  //                   Column(
                  //                     mainAxisAlignment: MainAxisAlignment.start,
                  //                     crossAxisAlignment: CrossAxisAlignment.start,
                  //                     children: [
                  //                       SizedBox(height: 10,),
                  //                       Text("Yeezy Boost 350", style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),),
                  //                       SizedBox(height: 8,),
                  //                       Text("Used | US11", style: TextStyle(color: Colors.grey),),
                  //                       SizedBox(height: 8,),
                  //                       Text("AED 500", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),),
                  //
                  //                     ],
                  //                   )
                  //
                  //                 ],
                  //               ),
                  //               SizedBox(height: 10,),
                  //               Row(
                  //                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //                 children: [
                  //                   Container(
                  //                     height: 30,
                  //                     width: 120,
                  //                     decoration: BoxDecoration(
                  //                         color: Colors.black,
                  //                         borderRadius: BorderRadius.circular(3)
                  //                     ),
                  //                     child:  Center(child: Text("COUNTER OFFER", style: TextStyle(color: Colors.white, fontSize: 9),)),
                  //                   ),
                  //                   Container(
                  //                     height: 30,
                  //                     width: 100,
                  //                     decoration: BoxDecoration(
                  //                         border: Border.all(color: Colors.green),
                  //                         borderRadius: BorderRadius.circular(3)
                  //                     ),
                  //                     child:  Center(child: Text("Accept", style: TextStyle(color: Colors.green , fontSize: 10),)),
                  //                   ),
                  //                   Container(
                  //                     height: 30,
                  //                     width: 100,
                  //                     decoration: BoxDecoration(
                  //                         border: Border.all(color: Colors.red),
                  //                         borderRadius: BorderRadius.circular(3)
                  //                     ),
                  //                     child:  Center(child: Text("REJECT", style: TextStyle(color: Colors.red , fontSize: 10),)),
                  //                   ),
                  //                 ],
                  //               )
                  //             ],
                  //           ),
                  //         ),
                  //       ],
                  //     ),
                  //   ) ,
                  // ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
