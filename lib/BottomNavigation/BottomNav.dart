import 'dart:io';

import 'package:flutter/material.dart';
import 'package:freelance2/API/API.dart';
import 'package:freelance2/AddProduct/addproduct.dart';
import 'package:freelance2/Model/Bottommodel.dart';
import 'package:freelance2/Offers/Offer.dart';
import 'package:freelance2/account.dart';
import 'package:freelance2/welcome.dart';

import '../PopularProduct.dart';

class BottomNav extends StatefulWidget {
  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _currentIndex = 0;
  var ind = 0;
  int i = 0;
  List<bottom> a = new List();
  final _formKey = GlobalKey<FormState>();
  // bool iconss;
  final List<bool> iconss = [
    true,
    false,
    false,
    false,
  ];
  final List<Widget> _children = [
    welcome(),
    PopularProduct(),
    offer(),
    Account(),
  ];

  void onTabTapped(int index) {
    //setState(() {
    //iconss=!iconss;
    _currentIndex = index;

    if (_currentIndex == index) {
      for (i = 0; i < 4; i++) {
        iconss[i] = false;
      }
      setState(() {
        iconss[_currentIndex] = true;
        ind = _currentIndex;
      });
    }

    //});
  }

  @override
  void initState() {
    //API.Category();
    // TODO: implement initState
    super.initState();
  }
  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return Form(
          key: _formKey,
          child: AlertDialog(
            title: Text('Are You Sure'),
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
                    child: Text('Yes'),
                    onPressed: ()=> exit(0),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
  Future<bool> _willPopCallback() async {

    // await showDialog or Show add banners or whatever
    // then
    return true; // return true if the route to be popped
  }
  @override
  Widget build(BuildContext context) {
    return 
      WillPopScope(
        onWillPop: _willPopCallback,
        child: Scaffold(
          body: _children[_currentIndex],
          floatingActionButton: Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Container(
              height: 80.0,
              width: 80.0,
              child: FittedBox(
                child: Container(
                  width: 80,
                  height: 80,
                  child: FloatingActionButton(
                    backgroundColor: Colors.black,
                    onPressed: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (_) => AddProduct()));
                    },
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                    // elevation: 5.0,
                  ),
                ),
              ),
            ),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: Container(
            decoration: BoxDecoration(

              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30), topLeft: Radius.circular(30)),
              boxShadow: [
                BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.0),
                topRight: Radius.circular(30.0),
              ),
              child: BottomNavigationBar(
                backgroundColor: Colors.white,
                selectedIconTheme: IconThemeData(opacity: 5, color: Colors.black),

                showSelectedLabels: false,
                showUnselectedLabels: false,
                // fixedColor: Colors.black,
                //unselectedIconTheme: IconThemeData( color:Colors.grey),
                unselectedItemColor: Colors.grey[100],
                type: BottomNavigationBarType.fixed,

                items: <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: Container(
                      width: 20,
                      height: 20,
                      child: iconss[0]
                          ? Image.asset(
                              'assets/home1.png',
                            )
                          : Image.asset(
                              'assets/home0.png',
                            ),
                    ),
                    title: Text('', style: TextStyle(fontSize: 25)),
                  ),
                  BottomNavigationBarItem(
                    icon: Padding(
                      padding: EdgeInsets.only(right: 50),
                      child: Container(
                        //
                        width: 20,
                        height: 20,
                        child: iconss[1]
                            ? Image.asset(
                                'assets/Vector1.png',
                              )
                            : Image.asset(
                                'assets/Vector1.png',
                              ),
                      ),
                    ),
                    title: Padding(
                      padding: EdgeInsets.only(right: 40),
                      child: Text('.', style: TextStyle(fontSize: 25)),
                    ),
                  ),
                  BottomNavigationBarItem(
                    icon: Padding(
                      padding: EdgeInsets.only(left: 50),
                      child: Container(
                        width: 20,
                        height: 20,
                        child: iconss[2]
                            ? Image.asset(
                                'assets/cartblack.png',
                              )
                            : Image.asset(
                                'assets/cart.png',
                              ),
                      ),
                    ),
                    title: Padding(
                      padding: const EdgeInsets.only(left: 40.0),
                      child: Text('.', style: TextStyle(fontSize: 25)),
                    ),
                  ),
                  BottomNavigationBarItem(
                    icon: Container(
                      width: 20,
                      height: 20,
                      child: iconss[3]
                          ? Image.asset(
                              'assets/user1.png',
                            )
                          : Image.asset(
                              'assets/user0.png',
                            ),
                    ),
                    title: Text('.', style: TextStyle(fontSize: 25)),
                  )
                ],
                currentIndex: _currentIndex,

                onTap: onTabTapped,
              ),
            ),
          )

          // bottomNavigationBar: Container(
          //
          //   decoration: BoxDecoration(
          //     color: Colors.black,
          //     borderRadius: BorderRadius.only(
          //
          //         topRight: Radius.circular(30), topLeft: Radius.circular(30)),
          //     boxShadow: [
          //       BoxShadow(
          //           color: Colors.black38, spreadRadius: 0, blurRadius: 10),
          //     ],
          //   ),
          //   child: ClipRRect(
          //     borderRadius: BorderRadius.only(
          //       topLeft: Radius.circular(30.0),
          //       topRight: Radius.circular(30.0),
          //     ),
          //     child: BottomAppBar(
          //       // elevation: 20.0,
          //
          //       // shape: CircularNotchedRectangle(),
          //         child: Container(
          //           height: 60,
          //           child: Row(
          //             // mainAxisSize: MainAxisSize.max,
          //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //
          //             children: <Widget>[
          //               IconButton(
          //                 iconSize: 30.0,
          //                 padding: EdgeInsets.only(left: 28.0),
          //                 icon: Icon(Icons.home),
          //                 onPressed: () {
          //                   setState(() {});
          //                 },
          //               ),
          //
          //               IconButton(
          //                 iconSize: 30.0,
          //                 padding: EdgeInsets.only(right: 28.0),
          //                 icon: Icon(Icons.local_fire_department),
          //                 onPressed: () {
          //                   setState(() {});
          //                 },
          //               ),
          //               IconButton(
          //                 iconSize: 30.0,
          //                 padding: EdgeInsets.only(left: 28.0),
          //                 icon: Icon(Icons.auto_fix_off),
          //                 onPressed: () {
          //                   setState(() {});
          //                 },
          //               ),
          //               IconButton(
          //                 iconSize: 30.0,
          //                 padding: EdgeInsets.only(right: 28.0),
          //                 icon: Icon(Icons.person_rounded),
          //                 onPressed: () {
          //                   setState(() {});
          //                 },
          //               )
          //             ],
          //           ),
          //         )),
          //   ),
          // )
          ),
      );
  }
}
