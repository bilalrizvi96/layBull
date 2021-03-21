import 'package:flutter/material.dart';
import 'package:freelance2/API/BaseUrl.dart';
import 'package:progress_dialog/progress_dialog.dart';

import 'API/API.dart';
import 'API/GloabalVariable.dart';
import 'constant.dart';
import 'dilogbar.dart';


class search extends StatefulWidget {
  @override
  _searchState createState() => _searchState();
}

class _searchState extends State<search> {
  TextEditingController name = new TextEditingController();
  var _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    // TODO: implement initState
    pr = ProgressDialog(context);
    super.initState();
    searchs.clear();
  }
  waittofetch() async {
    await Future.delayed(const Duration(seconds: 2), (){
      if(API.complete == 'true'){
        pr.hide();
        setState(() {

        });
        FocusScope.of(context).unfocus();
        print('data updated');
      }
      else{
        waittofetch();
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body:  Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.only(left:13.0,top:30,bottom: 5),
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10,),
                InkWell(

                    onTap: () {
                      Navigator.pop(context);

                    },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Container(
                            height: 20,
                            width: 20,
                            child: Image.asset('assets/ARROW.png',)),
                        SizedBox(width: 10,),
                        Text('Search',style: Textprimary,),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(left:15.0,right: 15.0),
                    child: Container(
                      height: MediaQuery.of(context).size.height / 14,
                      width: MediaQuery.of(context).size.width,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0,),
                        child:TextField(

                          decoration: InputDecoration(
                            hintStyle: TextStyle(fontSize: 14),
                            hintText: 'Search',alignLabelWithHint: true,
                            prefixIcon: Padding(
                              padding: const EdgeInsets.only(top:5.0),
                              child: Icon(Icons.search,color: Colors.black,size: 18,),
                            ),
                            border: InputBorder.none,
                            //contentPadding: EdgeInsets.all(20),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 5,),
                Container(height: MediaQuery.of(context).size.height/1.5,
                padding:EdgeInsets.all(8.0) ,
                child: searchs.length != 0 ?

                ListView.builder(
                   itemCount: searchs.length,
                    itemBuilder: (_,index)
                {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
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
                                        BaseUrl+searchs[index].image),
                                  ),
                                ],
                              ),
                              searchs[index].popular=="1"?
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
                                  child: Image.asset(
                                      'assets/fire.png'),
                                ),
                              ):Container(),
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
                                    searchs[index].name.toUpperCase(),
                                    style:  listtext1,
                                  ),
                                ),
                                Text(searchs[index].prices.toUpperCase(),
                                    style:  listtext2),
                                SizedBox(height: 1,),
                                Text(searchs[index].type==0?"Used".toUpperCase():"New".toUpperCase(),
                                    style:  listtext3),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );

                }):Center(child: Text('No Product Found', style: TextStyle(color: Colors.black),), ),
                ),
                // Row(
                //   children: [
                //     Text(
                //       'RECENT SEARCHERS',
                //       style: Textprimary,
                //     ),
                //     Spacer(),
                //     Padding(
                //       padding: const EdgeInsets.all(2.0),
                //       child: Container(
                //         height: 30,
                //         width: 70,
                //         decoration: BoxDecoration(
                //           color: Color(0xffF4F4F4),
                //           borderRadius: BorderRadius.circular(3),
                //         ),
                //         child: Padding(
                //           padding: const EdgeInsets.only(left:25.0,top: 10),
                //           child: Text('Clear', style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold,color: Colors.grey),),
                //         ),
                //       ),
                //     ),
                //
                //   ],
                // ),

                // SizedBox(height: 5,),
                // Text('Nike Air Forces',style: Textsearch,),
                // SizedBox(height: 5,),
                // Text('Gucci',style: Textsearch,),
                // SizedBox(height: 5,),
                // Text('Ralph Lauren',style: Textsearch,),
                // SizedBox(height: 5,),
                // Text('Nike Dior',style: Textsearch,),
                // SizedBox(height: 5,),
                // Text('Addidas Profile',style: Textsearch,),
                // SizedBox(height: 5,),
                // Spacer(),
                InkWell(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      builder: (context) => Container(
                        padding: EdgeInsets.only(
                            bottom: MediaQuery.of(context).viewInsets.bottom),
                        child: BottomSheetExample(),
                      ),
                    );
                  },
                  child: Row(
                    children: [
                      Spacer(),
                      Text('FILTERS',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 10),),
                      SizedBox(width: 5,),
                      Container(
                        height: 10,
                        width: 10,
                        child: Column(
                          children: [
                            Image.asset('assets/filter2.png'),
                            Image.asset('assets/filter1.png'),
                            Image.asset('assets/filter2.png'),
                          ],
                        ),
                      ),
                      Spacer(),

                    ],
                  ),
                ),
                SizedBox(height: 5,),
                // Container(
                //   height: MediaQuery.of(context).size.height/12,
                //   width: MediaQuery.of(context).size.width/1.1,
                //   decoration: BoxDecoration(
                //     color: Colors.black,
                //     borderRadius: BorderRadius.circular(6),
                //   ),
                //   child: Center(
                //       child: Text('SEARCH',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 12),
                //       )),
                // )
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar:
      InkWell(
        onTap: ()async{
          if(_formKey.currentState.validate()) {
            pr.show();
            API.Search(name.text.toString());
            waittofetch();
          }
        },
        child: Container(
          height: MediaQuery.of(context).size.height/12,
          width: MediaQuery.of(context).size.width/1.1,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(6),
          ),
          child: Center(
              child: Text('SEARCH',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 12),
              )),
        ),
      ),
    );
  }

}
