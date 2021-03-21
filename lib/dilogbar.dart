import 'package:flutter/material.dart';
import 'package:flutter_xlider/flutter_xlider.dart';
import 'package:freelance2/API/BaseUrl.dart';
import 'package:freelance2/AddProduct/sizelist.dart';


import 'API/GloabalVariable.dart';
import 'colorlist.dart';
import 'constant.dart';
import 'listbrand.dart';

class BottomSheetExample extends StatefulWidget {
  @override
  _BottomSheetExampleState createState() => _BottomSheetExampleState();
}

class _BottomSheetExampleState extends State<BottomSheetExample> {

  @override
  String valueChoose;
  // List listItem = [
  //   "English",
  //   "Spanish",
  //   "Urdu",
  // ];
  Widget build(BuildContext context) {
    return  Container(
      height: MediaQuery.of(context).size.height/1.1,
      color: Color(0xff757575),
      child: Container(
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(height: 5,),
            Container(
              child: Divider(
                height: 1,
                thickness: 5,
                indent: 100,
                endIndent: 100,
              ),
            ),
            SizedBox(height: 15,),
            Text('SET FILTERS',style:Textprimary,textAlign: TextAlign.center,),
            SizedBox(height: 15,),
            Text('BRAND',style:Textprimary,),
            SizedBox(height: 15,),
            Container(
              //color: Colors.grey,
              height: 59,
              width: MediaQuery.of(context).size.width / 1.13,
              child: new ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: brands.length,
                  itemBuilder: (_, index) {
                    return Padding(
                        padding: const EdgeInsets.only(
                            left: 5.0, top: 5, bottom: 6),
                        child: Container(
                          height: 54,
                          width: MediaQuery.of(context).size.width / 2.8,
                          decoration: BoxDecoration(
                            border: Border.all(color: Color(0xffD5D5D5)),

                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Spacer(),
                                Image.network(BaseUrl+brands[index].picture),
                                Spacer(),
                                Container(
                                  width: MediaQuery.of(context).size.width/5,
                                  child: Text(
                                    brands[index].name,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,),maxLines: 1,
                                  ),
                                ),
                                Spacer(),
                              ],
                            ),
                          ),
                        ));
                  }),
            ),
            SizedBox(height: 15,),
            Text('COlOR',style:Textprimary,),
            SizedBox(height: 15,),
            Container(
              //color: Colors.grey,
              height: 59,
              width: MediaQuery.of(context).size.width / 1.13,
              child: new ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount:  colorList.length,
                  itemBuilder: (_, index) {
                    return Column(
                      children: [

                        Row(
                          children: [
                            colorList[index].dest,
                            SizedBox(width: 5,)
                          ],
                        ),
                      ],
                    );
                  }),
            ),
            SizedBox(height: 15,),
            Text('CATEGORY',style:Textprimary,),
            SizedBox(height: 15,),
            Container(
              padding: EdgeInsets.only(left: 10, right: 10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(5.0),),
              child: DropdownButton(
                isExpanded: true,
                hint: Text('Select Category'),
                dropdownColor: Colors.grey[100],
                icon: Icon(
                  Icons.keyboard_arrow_down_outlined,
                  size: 20,
                  color: Colors.black,
                ),
                iconSize: 12,
                underline: SizedBox(),
                style: TextStyle(color: Colors.black, fontSize: 15),
                value: valueChoose,
                onChanged: (newValue) {
                  setState(() {
                    valueChoose = newValue;
                  });
                },
                items: category.map((valueItem) {
                  return DropdownMenuItem(
                    value: valueItem,
                    child: new Row(
                      //  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text(valueItem.name),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),
            SizedBox(height: 15,),
            Text('SIZE',style:Textprimary,),
            SizedBox(height: 15,),
            Container(
              //color: Colors.grey,
              height: 59,
              width: MediaQuery.of(context).size.width / 1.17,

              child: new ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: slideSize.length,
                  itemBuilder: (_, index) {
                    return Padding(
                        padding: const EdgeInsets.only(
                            left: 5.0, top: 5, bottom: 6),
                        child: Container(
                          height: 54,
                          width: MediaQuery.of(context).size.width / 7.6,
                          decoration: BoxDecoration(
                            border: Border.all(color: Color(0xffD5D5D5)),

                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Center(
                            child: Text(
                              slideSize[index].destination,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold),
                            ),

                          ),
                        ));
                  }),
            ),
            SizedBox(height: 15,),
            Container(
              child: Row(children: [
                Container(
                  height: 45,
                  width: MediaQuery.of(context).size.width /3,
                  child: TextFormField(
                      style: TextStyle(

                          fontSize: 15,
                          fontFamily: 'Metropolis',
                          letterSpacing: 2.2),
                      decoration: InputDecoration(
                          hintText:'min:00',
                          border: InputBorder.none,
                          fillColor: Color(0xfff3f3f4),
                          filled: true)),
                ),
                Spacer(),
                Container(
                  height: 45,
                  width: MediaQuery.of(context).size.width / 3,
                  child: TextFormField(
                      style: TextStyle(

                          fontSize: 15,
                          fontFamily: 'Metropolis',
                          letterSpacing: 2.2),
                      decoration: InputDecoration(
                          hintText:'max:00',
                          border: InputBorder.none,
                          fillColor: Color(0xfff3f3f4),
                          filled: true)),
                ),
              ],)
//               FlutterSlider(
//                 values: [0, 10000],
//                 max: 10000,
//                 min: 0,
//                 rangeSlider: true,
//                 handler: FlutterSliderHandler(
//
//                   decoration: BoxDecoration(),
//                   child: Material(
//                     type: MaterialType.circle,
//                     color: Colors.black,
//                     elevation: 3,
//                     child: Container(
//                         padding: EdgeInsets.all(5),
//                         child: Icon(Icons.adjust,
//                           size: 20,
//                           color: Colors.black,)),
//                   ),
//                 ),
//                 trackBar: FlutterSliderTrackBar(
//
//                   activeTrackBar: BoxDecoration(
//                     borderRadius: BorderRadius.circular(4),
//                     color: Colors.black,
//                   ),
//                 ),
//                 rightHandler: FlutterSliderHandler(
//
//                   child: Icon(
//                     Icons.adjust,
//                     color: Colors.black,
//                     size: 24,
//                   ),
//                 ),
// //                onDragging: (handlerIndex, lowerValue, upperValue) {
// //                  _lowerValue = lowerValue;
// //                  _upperValue = upperValue;
// //                  setState(() {});
// //                },
//                 tooltip: FlutterSliderTooltip(
//                   leftPrefix: Icon(
//                     Icons.attach_money,
//                     size: 19,
//                     color: Colors.black45,
//                   ),
//                   rightPrefix: Icon(
//                     Icons.attach_money,
//                     size: 19,
//                     color: Colors.black45,
//                   ),
//                 ),
//               ),

            ),
            SizedBox(height: 30,),
            Container(
              alignment: Alignment.bottomCenter,
              height: MediaQuery.of(context).size.height/13,
              width: MediaQuery.of(context).size.width/1.1,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Center(
                  child: Text('SEARCH',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 12),
                  )),
            )

          ],
        ),
      ),
    );
  }
}




