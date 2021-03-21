import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:freelance2/AddProduct/sizelist.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:url_launcher/url_launcher.dart';

import 'API/API.dart';
import 'API/BaseUrl.dart';
import 'constant.dart';
import 'lists.dart';

class addtrochart extends StatefulWidget {

  var favourite;
  var product;
  addtrochart({this.product , this.favourite});

  @override
  _addtrochartState createState() => _addtrochartState(this.product, this.favourite);
}

class _addtrochartState extends State<addtrochart> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _bidController = new TextEditingController();
  ProgressDialog pr;
  var favourite;
  var product;
  var paymetlink;
  _addtrochartState(this.product , this.favourite);
  var images = [];

  @override
  void initState() {
    pr = ProgressDialog(context);

    for(int i =0; i< product.images.length; i++ ){
      images.add(Image.network(BaseUrl + product.images[i]),);
    }
    super.initState();
  }

  waittoBid() async {
    await Future.delayed(const Duration(seconds: 2), (){
      if(API.complete == 'true'){

        pr.hide();
        Navigator.of(context).pop();

      }
      else{
        waittoBid();
      }
    });
  }

  waittoPayment() async {
    await Future.delayed(const Duration(seconds: 2), (){
      if(API.complete == 'true'){

        pr.hide();
        Navigator.of(context).pop();
        paymetlink = API.paymentlink;
        paymetlink = paymetlink.toString();
        print("huiujnnojkjnjnjion  "+ paymetlink);
        _launchInWebViewOrVC(paymetlink);

      }
      else{
        waittoPayment();
      }
    });
  }

  Future<void> _launchInWebViewOrVC(String url) async {

      await launch(

        url,
        forceSafariVC: true,
        forceWebView: true,
        enableJavaScript: true,

        //headers: <String, String>{'my_header_key': 'my_header_value'},
      );
    // } else {
    //   throw 'Could not launch $url';
    // }
  }


  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return Form(
          key: _formKey,
          child: AlertDialog(
            title: Text('MAKE OFFER'),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text('Would you like to BID on this Product?'),
                  TextFormField(
                      obscureText: true,
                      controller: _bidController,
                      validator: (value){
                        if(value.isEmpty){
                          return 'Please enter Bid amount';
                        }
                        return null;
                      },
                      style: TextStyle(
                          fontSize: 15, fontFamily: 'Metropolis', letterSpacing: 2.2),
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          fillColor: Color(0xfff3f3f4),
                          filled: true)
                  ),
                ],
              ),
            ),
            actions: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    child: Text('Cancel'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),

                  TextButton(
                    child: Text('BID'),
                    onPressed: () {
                      if(_formKey.currentState.validate()){
                        FocusScope.of(context).unfocus();
                        pr.show();
                        API.Bid(product.vendor,product.id, _bidController.text);
                        waittoBid();

                      }
                    },
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _showMyDialogPayment() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return Form(
          key: _formKey,
          child: AlertDialog(
            title: Text('Payment'),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text('you want to purchase '+product.name +" at AED"+product.prices+" Price"),
                ],
              ),
            ),
            actions: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    child: Text('NO'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),

                  TextButton(
                    child: Text('YES'),
                    onPressed: () {
                      pr.show();
                      API.payment(product.prices, "test@gmail.com");
                      waittoPayment();
                    },
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget image_slider_carousel = Container(
      height: 150,
      child: Carousel(
        images: images,
        dotSize: 8.0,
        borderRadius: true,
        dotPosition: DotPosition.bottomCenter,
        dotBgColor: Colors.transparent,
        dotColor: Colors.black,

      ),
    );
    return SafeArea(
      child: Scaffold(

          body: SingleChildScrollView(
              child: new Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        // Container(
                        //     height: 300,
                        //     width: MediaQuery.of(context).size.width,
                        //     child: Image.asset("assets/color.png")),
                        Padding(
                          padding:
                              const EdgeInsets.only(top: 20.0, left: 15, right: 15),
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
                              Text('Product Detail',style: Textprimary,),
                              Spacer(),
                              // Container(
                              //   height: 30,
                              //   width: 30,
                              //   decoration: BoxDecoration(
                              //     color: Colors.white,
                              //     borderRadius: BorderRadius.circular(20),
                              //   ),
                              //   // child: favourite ? Image.asset('assets/fire.png') :
                              //   // Image.asset('assets/Vector1.png'),
                              // ),
                              // SizedBox(
                              //   width: 3,
                              // ),
                              // Image.asset('assets/Vector.png'),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 118.0),
                          child:
                          image_slider_carousel
                        ),
                      ],
                    ),
                    SizedBox(height: 15,),
                    Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Spacer(),
                              Padding(
                                padding: const EdgeInsets.only(top: 1.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      product.name,
                                      style: TextStyle(
                                          fontSize: 20, fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Text(product.prices,
                                        style: TextStyle(
                                            fontSize: 15, fontWeight: FontWeight.w600,color: Colors.grey)),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Text(product.type == 0 ? 'Used':"New",
                                        style: TextStyle(
                                            fontSize: 12, fontWeight: FontWeight.w200,color: Colors.grey[500])),
                                  ],
                                ),
                              ),
                              Spacer(),
                            ],
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 15, left: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  onTap: (){
                                    _showMyDialog();
                                  },
                                  child: Container(
                                      height: 45,
                                      width: MediaQuery.of(context).size.width/2.5,
                                      decoration: BoxDecoration(
                                          color: Colors.black,
                                          borderRadius: BorderRadius.circular(8)
                                      ),
                                      child: Center(child: Text("MAKE OFFER", style: TextStyle(color: Colors.white,letterSpacing: 1.1, fontWeight: FontWeight.w800, fontSize: 10),))
                                  ),
                                ),

                                InkWell(
                                  onTap: (){
                                    _showMyDialogPayment();
                                  },
                                  child: Container(
                                      height: 45,
                                      width: MediaQuery.of(context).size.width/2.5,
                                      decoration: BoxDecoration(
                                          color: Colors.black,
                                          borderRadius: BorderRadius.circular(8)

                                      ),
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(top: 8,left: 30),
                                            child: Row(
                                              children: [

                                                Icon(Icons.assignment_turned_in, color: Colors.white,size: 15,),
                                                SizedBox(width: 2,),
                                                Text("BUY NOW", style: TextStyle(color: Colors.white,letterSpacing: 1.12, fontWeight: FontWeight.bold, fontSize: 10),),
                                              ],
                                            ),
                                          ),
                                          SizedBox(height: 2,),
                                          Text("Verified Authentication", style: TextStyle(color: Colors.white,letterSpacing: 0.12, fontSize: 10),),
                                        ],
                                      )
                                  ),
                                ),

                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            height: 120,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(color: Colors.lightBlueAccent)
                            ),

                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left:12.0,top: 10),
                                      child: Icon(Icons.assignment_turned_in,color: Colors.lightBlueAccent),
                                    ),
                                    SizedBox(width: 2,),
                                    Padding(
                                      padding: const EdgeInsets.only(left:15.0,top: 10),
                                      child: Text("Verified Authentic", style: TextStyle(color: Colors.lightBlueAccent,fontWeight: FontWeight.bold),),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10,),
                                Container(
                                    width: 300,
                                    child: Padding(
                                      padding: const EdgeInsets.only(left:12.0),
                                      child: Text("All items are sent to lay bull's authenticationteam for in-hand verification before being shipped out to you." ,style: TextStyle(color: Colors.lightBlueAccent),),
                                    )),
                                SizedBox(height: 3,),
                                Padding(
                                  padding: const EdgeInsets.only(left:12.0),
                                  child: Text('Learn More',style: TextStyle(color: Colors.lightBlueAccent)),
                                )
                              ],
                            ),
                          ),
                          // Text(
                          //   'Size',
                          //   style: Textprimary,
                          // ),
                          // SizedBox(
                          //   height: 5,
                          // ),
                          // Container(
                          //   //color: Colors.grey,
                          //   height: 55,
                          //   width: MediaQuery.of(context).size.width / 1.13,
                          //
                          //   child: new ListView.builder(
                          //       scrollDirection: Axis.horizontal,
                          //       itemCount: slideSize.length,
                          //       itemBuilder: (_, index) {
                          //         return Padding(
                          //             padding: const EdgeInsets.only(
                          //                 left: 5.0, top: 5, bottom: 6),
                          //             child: Container(
                          //               height: 54,
                          //               width: MediaQuery.of(context).size.width / 7.5,
                          //               decoration: BoxDecoration(
                          //                 border: Border.all(color: Color(0xffD5D5D5)),
                          //                 borderRadius: BorderRadius.circular(6),
                          //               ),
                          //               child: Center(
                          //                 child: Text(
                          //                   slideSize[index].destination,
                          //                   style:
                          //                       TextStyle(fontWeight: FontWeight.bold),
                          //                 ),
                          //               ),
                          //             ));
                          //       }),
                          // ),
                          // SizedBox(
                          //   height: 5,
                          // ),
                          // Container(
                          //   height: MediaQuery.of(context).size.height / 13,
                          //   width: MediaQuery.of(context).size.width / 1.1,
                          //   decoration: BoxDecoration(
                          //     color: Colors.black,
                          //     borderRadius: BorderRadius.circular(6),
                          //   ),
                          //   child: Center(
                          //       child: Text(
                          //     'ADD TO CART',
                          //     style: TextStyle(
                          //         color: Colors.white,
                          //         fontWeight: FontWeight.bold,
                          //         fontSize: 12),
                          //   )),
                          // ),
                          // SizedBox(
                          //   height: 12,
                          // ),

                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            'DESCRIPTION',
                            style: Textprimary,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            product.shortdesc != null ? product.shortdesc : "No Description Available",
                            style: LiteText,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text('COMPOSITION', style: Textprimary),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              Text(
                                'Sole :',
                                style: Textsearch,
                              ),
                              Spacer(),
                              Text(
                                'Rubber 100%',
                                style: LiteText,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              Text(
                                'Outer Material :',
                                style: Textsearch,
                              ),
                              Spacer(),
                              Text(
                                'Leather 100% ,Nylon 100%',
                                style: LiteText,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              Text(
                                'LINNING :',
                                style: Textsearch,
                              ),
                              Spacer(),
                              Text(
                                'Nylon 100%',
                                style: LiteText,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              Text(
                                'DESIGN STYLE ID :',
                                style: Textsearch,
                              ),
                              Spacer(),
                              Text(
                                'CN8973HFG',
                                style: LiteText,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),

                              Container(
                                  height: MediaQuery.of(context).size.height / 13,
                                  width: MediaQuery.of(context).size.width / 1.1,
                                  decoration: BoxDecoration(
                                 border: Border.all(   color: Colors.black,),
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                    child: Center(
                                        child: Text(
                                          'Size GuidLine',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w600,
                                              fontStyle: FontStyle.normal,
                                              fontFamily: 'aveh',
                                              letterSpacing: 1,
                                              fontSize: 15.0),
                                        )),
                          ),
                          SizedBox(
                            height: 12,)
                          // Text('RELATED PRODUCTS', style: Textprimary),
                          // Container(
                          //   height: MediaQuery.of(context).size.height / 3.5,
                          //   width: MediaQuery.of(context).size.width,
                          //   //color: Colors.black,
                          //   child: GridView.builder(
                          //     gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                          //         maxCrossAxisExtent: 200,
                          //         // childAspectRatio: (itemWidth / itemHeight),
                          //         crossAxisSpacing: 20,
                          //         mainAxisSpacing: 20),
                          //     physics: NeverScrollableScrollPhysics(),
                          //     itemCount: slideList.length,
                          //     itemBuilder: (BuildContext ctx, index) {
                          //       return Container(
                          //         child: Column(
                          //           mainAxisAlignment: MainAxisAlignment.start,
                          //           crossAxisAlignment: CrossAxisAlignment.start,
                          //           children: [
                          //             Stack(
                          //               children: [
                          //                 Column(
                          //                   children: [
                          //                     Container(
                          //                       height: 100,
                          //                       width:
                          //                           MediaQuery.of(context).size.width /
                          //                               2.4,
                          //                       decoration: BoxDecoration(
                          //                         color: Greycolor,
                          //                         borderRadius:
                          //                             BorderRadius.circular(10),
                          //                       ),
                          //                       child:
                          //                           Image.asset(slideList[index].image),
                          //                     ),
                          //                   ],
                          //                 ),
                          //                 Padding(
                          //                   padding: const EdgeInsets.only(
                          //                       left: 120.0, top: 77),
                          //                   child: Container(
                          //                     height: 30,
                          //                     width: 30,
                          //                     decoration: BoxDecoration(
                          //                       color: Colors.white,
                          //                       borderRadius: BorderRadius.circular(20),
                          //                     ),
                          //                     child: Image.asset('assets/fire.png'),
                          //                   ),
                          //                 ),
                          //                 // Padding(
                          //                 //   padding: const EdgeInsets.only(top:123.0),
                          //                 //   child: Column(
                          //                 //     mainAxisAlignment: MainAxisAlignment.start,
                          //                 //     crossAxisAlignment: CrossAxisAlignment.start,
                          //                 //     children: [
                          //                 //       Text('Air Jordan 1 Dior',style: TextStyle(fontSize: 10),),
                          //                 //       Text('425 AED',style: TextStyle(fontSize: 10)),
                          //                 //       Text('Used',style: TextStyle(fontSize: 10)),
                          //                 //
                          //                 //     ],
                          //                 //   ),
                          //                 // )
                          //               ],
                          //             ),
                          //             Padding(
                          //               padding: const EdgeInsets.only(top: 1.0),
                          //               child: Column(
                          //                 mainAxisAlignment: MainAxisAlignment.start,
                          //                 crossAxisAlignment: CrossAxisAlignment.start,
                          //                 children: [
                          //                   Text(
                          //                     'Air Jordan 1 Dior',
                          //                     style: TextStyle(
                          //                         fontSize: 10,
                          //                         fontWeight: FontWeight.w500),
                          //                   ),
                          //                   Text('425 AED',
                          //                       style: TextStyle(
                          //                           fontSize: 10,
                          //                           fontWeight: FontWeight.bold)),
                          //                   Text('Used',
                          //                       style: TextStyle(
                          //                           fontSize: 10,
                          //                           fontWeight: FontWeight.w200)),
                          //                 ],
                          //               ),
                          //             )
                          //           ],
                          //         ),
                          //       );
                          //     },
                          //   ),
                          // ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
      )),
    );
  }
}
// Image.asset("assets/images/color.png"),
// Row(
// children: [
// InkWell(
// onTap: () {
// Navigator.pop(context);
// },
// child: Container(
// height: 20,
// width: 20,
// child: Image.asset(
// 'assets/images/ARROW.png',
// )),
// ),
// SizedBox(
// width: 10,
// ),
// Spacer(),
// Container(
// height: 30,
// width: 30,
// decoration: BoxDecoration(
// color: Colors.white,
// borderRadius:
// BorderRadius.circular(20),
// ),
// child: Image.asset(
// 'assets/images/fire.png'),
// ),
// SizedBox(width: 3,),
// Image.asset('assets/images/Vector.png'),
// ],
// ),
// Container(
// height: 100,
// width: MediaQuery.of(context).size.width,
// child: Image.asset('assets/images/bigshoe.png'),
// ),
