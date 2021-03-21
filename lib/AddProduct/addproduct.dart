import 'dart:io';

import 'package:flutter/material.dart';
import 'package:freelance2/API/GloabalVariable.dart';
import 'package:freelance2/AddProduct/ColorList.dart';
import 'package:freelance2/AddProduct/sizelist.dart';
import 'package:freelance2/constant.dart';
import 'package:image_picker/image_picker.dart';

class AddProduct extends StatefulWidget {
  @override
  _AddProductState createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {

  String valueChoose1;
  // List listItem1 = [
  //   "English",
  //   "Spanish",
  //   "Urdu",
  // ];
  //
  String valueChoose2;
  // List listItem2 = [
  //   "Addidas",
  //   "Nike",
  //
  // ];
  //
   String valueChoose3;
  List listItem3 = [
    "New",
    "Used",

  ];

  File _pickedImageL1;
  File _image;



  _imgFromCamera() async {
    File image = await ImagePicker.pickImage(
        source: ImageSource.camera, imageQuality: 50
    );

    setState(() {
      _image = image;
    });
  }

  _imgFromGallery() async {
    File image = await  ImagePicker.pickImage(
        source: ImageSource.gallery, imageQuality: 50
    );

    setState(() {
      _image = image;
    });
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(left: 20,right: 20, top: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.arrow_back),
                      SizedBox(width: 10,),
                      Text("SELL", style: Textprimary),

                    ],
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Text(
                    "CATEGORY",
                    style: Textprimary,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    decoration: BoxDecoration(
                    border: Border.all(color:Colors.grey[400]),
                    borderRadius: BorderRadius.circular(5.0),),
                    child: DropdownButton(
                      isExpanded: true,
                      hint: Text("Select Category"),
                      dropdownColor: Colors.grey[100],
                      icon: Icon(
                        Icons.keyboard_arrow_down_outlined,
                        size: 20,
                        color: Colors.black,
                      ),
                      iconSize: 12,
                      underline: SizedBox(),
                      style: TextStyle(color: Colors.black, fontSize: 15),
                      value: valueChoose1,
                      onChanged: (newValue) {
                        setState(() {
                          valueChoose1 = newValue;
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
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "PRODUCT NAME",
                    style: Textprimary,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width/1.07,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: Colors.grey[400])
                    ),
                    child: TextField(
                        style: TextStyle(
                          fontSize: 18,
                        ),

                        decoration: InputDecoration(
                          border: InputBorder.none,
                          fillColor: Color(0xfff3f3f4),
                          // labelText: "Enter Product Name",
                          // labelStyle: TextStyle(
                          //     fontSize: 13,fontWeight: FontWeight.w500
                          //),
                        )),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "BRAND",
                    style: Textprimary,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    decoration: BoxDecoration(
                      border: Border.all(color:Colors.grey[400]),
                      borderRadius: BorderRadius.circular(5.0),),
                    child: DropdownButton(
                      isExpanded: true,
                      hint: Text('Select Brand'),
                      dropdownColor: Colors.grey[100],
                      icon: Icon(
                        Icons.keyboard_arrow_down_outlined,
                        size: 20,
                        color: Colors.black,
                      ),
                      iconSize: 12,
                      underline: SizedBox(),
                      style: TextStyle(color: Colors.black, fontSize: 15),
                      value: valueChoose2,
                      onChanged: (newValue) {
                        setState(() {
                          valueChoose2 = newValue;
                        });
                      },
                      items: brands.map((valueItem) {
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
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "CONDITION",
                    style: Textprimary,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    decoration: BoxDecoration(
                      border: Border.all(color:Colors.grey[400]),
                      borderRadius: BorderRadius.circular(5.0),),
                    child: DropdownButton(
                      isExpanded: true,
                      hint: Text('Used'),
                      dropdownColor: Colors.grey[100],
                      icon: Icon(
                        Icons.keyboard_arrow_down_outlined,
                        size: 20,
                        color: Colors.black,
                      ),
                      iconSize: 12,
                      underline: SizedBox(),
                      style: TextStyle(color: Colors.black, fontSize: 15),
                      value: valueChoose3,
                      onChanged: (newValue) {
                        setState(() {
                          valueChoose3 = newValue;
                        });
                      },
                      items: listItem3.map((valueItem) {
                        return DropdownMenuItem(
                          value: valueItem,
                          child: new Row(
                            //  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Text(valueItem),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "AVAILABLE SIZES",
                    style: Textprimary,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    //color: Colors.grey,
                    height: 55,
                    width: MediaQuery.of(context).size.width / 1.13,

                    child: new ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: slideSize.length,
                        itemBuilder: (_, index) {
                          return Padding(
                              padding: const EdgeInsets.only(
                                  left: 5.0, top: 5, bottom: 6),
                              child: Container(
                                height: 54,
                                width: MediaQuery.of(context).size.width / 7.5,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Color(0xffD5D5D5)),
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Center(
                                  child: Text(
                                    slideSize[index].destination,
                                    style:
                                    TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ));
                        }),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "PRICE",
                    style: Textprimary,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width/1.07,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: Colors.grey[400])
                    ),
                    child: TextField(
                        style: TextStyle(
                          fontSize: 18,
                        ),

                        decoration: InputDecoration(
                          border: InputBorder.none,
                          fillColor: Color(0xfff3f3f4),
                          suffixIcon: Container(
                            height: 40,
                            width: 20,
                              child: Center(child: Text("AED", style: TextStyle(fontSize: 13,fontWeight: FontWeight.w500),))),
                          // labelText: "Enter Product Name",
                          // labelStyle: TextStyle(
                          //     fontSize: 13,fontWeight: FontWeight.w500
                          //),
                        )

                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "AVAILABLE COLORS",
                    style: Textprimary,
                  ),
                  SizedBox(
                    height: 20,
                  ),
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
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "PHOTOS",
                    style: Textprimary,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 75,
                        width: 75,
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 1.0,
                          ),
                          borderRadius:
                          BorderRadius.all(Radius.circular(5.0)),
                        ),
                        child: Center(
                          child: GestureDetector(
                            onTap: () {
                              _showPicker(context);
                            },
                            child: Container(
                              // radius: 55,
                              // backgroundColor: Color(0xffFDCF09),
                              child: _image != null
                                  ? Image.file(
                                    _image,
                                    width: 100,
                                    height: 100,
                                    fit: BoxFit.fitHeight,
                                  )
                                  : Container(
                                decoration: BoxDecoration(
                                    color: Color(0xFFE5F3FD),
                                    borderRadius: BorderRadius.circular(0)),
                                width: 100,
                                height: 100,
                                child: Icon(
                                  Icons.camera_alt,
                                  color: Colors.grey[800],
                                ),
                              ),
                            ),
                          ),
                        )
                      ),
                      Container(
                          height: 75,
                          width: 75,
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 1.0,
                            ),
                            borderRadius:
                            BorderRadius.all(Radius.circular(5.0)),
                          ),
                          child: Center(
                            child: GestureDetector(
                              onTap: () {
                                _showPicker(context);
                              },
                              child: Container(
                                // radius: 55,
                                // backgroundColor: Color(0xffFDCF09),
                                child: _image != null
                                    ? Image.file(
                                  _image,
                                  width: 100,
                                  height: 100,
                                  fit: BoxFit.fitHeight,
                                )
                                    : Container(
                                  decoration: BoxDecoration(
                                      color:  Color(0xFFE5F3FD),
                                      borderRadius: BorderRadius.circular(0)),
                                  width: 100,
                                  height: 100,
                                  child: Icon(
                                    Icons.camera_alt,
                                    color: Colors.grey[800],
                                  ),
                                ),
                              ),
                            ),
                          )
                      ),
                      Container(
                          height: 75,
                          width: 75,
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 1.0,
                            ),
                            borderRadius:
                            BorderRadius.all(Radius.circular(5.0)),
                          ),
                          child: Center(
                            child: GestureDetector(
                              onTap: () {
                                _showPicker(context);
                              },
                              child: Container(
                                // radius: 55,
                                // backgroundColor: Color(0xffFDCF09),
                                child: _image != null
                                    ? Image.file(
                                  _image,
                                  width: 100,
                                  height: 100,
                                  fit: BoxFit.fitHeight,
                                )
                                    : Container(
                                  decoration: BoxDecoration(
                                      color:  Color(0xFFE5F3FD),
                                      borderRadius: BorderRadius.circular(0)),
                                  width: 100,
                                  height: 100,
                                  child: Icon(
                                    Icons.camera_alt,
                                    color: Colors.grey[800],
                                  ),
                                ),
                              ),
                            ),
                          )
                      ),
                      Container(
                          height: 75,
                          width: 75,
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 1.0,
                            ),
                            borderRadius:
                            BorderRadius.all(Radius.circular(5.0)),
                          ),
                          child: Center(
                            child: GestureDetector(
                              onTap: () {
                                _showPicker(context);
                              },
                              child: Container(
                                // radius: 55,
                                // backgroundColor: Color(0xffFDCF09),
                                child: _image != null
                                    ? Image.file(
                                  _image,
                                  width: 100,
                                  height: 100,
                                  fit: BoxFit.fitHeight,
                                )
                                    : Container(
                                  decoration: BoxDecoration(
                                      color:  Color(0xFFE5F3FD),
                                      borderRadius: BorderRadius.circular(0)),
                                  width: 100,
                                  height: 100,
                                  child: Icon(
                                    Icons.camera_alt,
                                    color: Colors.grey[800],
                                  ),
                                ),
                              ),
                            ),
                          )
                      ),
                    ],
                  ),
                  SizedBox(height: 5,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Appereance', style:TextStyle(fontSize: 11,fontWeight: FontWeight.w600, letterSpacing: 1.1),),
                      Text('Front', style:TextStyle(fontSize: 11,fontWeight: FontWeight.w600, letterSpacing:1.1),),
                      Text('Left Shot', style:TextStyle(fontSize: 11,fontWeight: FontWeight.w600, letterSpacing: 1.1),),
                      Text('Right Shot', style:TextStyle(fontSize: 11,fontWeight: FontWeight.w600, letterSpacing: 1.1),),
                    ],
                  ),
                  SizedBox(height: 15,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          height: 75,
                          width: 75,
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 1.0,
                            ),
                            borderRadius:
                            BorderRadius.all(Radius.circular(5.0)),
                          ),
                          child: Center(
                            child: GestureDetector(
                              onTap: () {
                                _showPicker(context);
                              },
                              child: Container(
                                // radius: 55,
                                // backgroundColor: Color(0xffFDCF09),
                                child: _image != null
                                    ? Image.file(
                                  _image,
                                  width: 100,
                                  height: 100,
                                  fit: BoxFit.fitHeight,
                                )
                                    : Container(
                                  decoration: BoxDecoration(
                                      color:  Color(0xFFE5F3FD),
                                      borderRadius: BorderRadius.circular(0)),
                                  width: 100,
                                  height: 100,
                                  child: Icon(
                                    Icons.camera_alt,
                                    color: Colors.grey[800],
                                  ),
                                ),
                              ),
                            ),
                          )
                      ),
                      Container(
                          height: 75,
                          width: 75,
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 1.0,
                            ),
                            borderRadius:
                            BorderRadius.all(Radius.circular(5.0)),
                          ),
                          child: Center(
                            child: GestureDetector(
                              onTap: () {
                                _showPicker(context);
                              },
                              child: Container(
                                // radius: 55,
                                // backgroundColor: Color(0xffFDCF09),
                                child: _image != null
                                    ? Image.file(
                                  _image,
                                  width: 100,
                                  height: 100,
                                  fit: BoxFit.fitHeight,
                                )
                                    : Container(
                                  decoration: BoxDecoration(
                                      color: Color(0xFFE5F3FD),
                                      borderRadius: BorderRadius.circular(0)),
                                  width: 100,
                                  height: 100,
                                  child: Icon(
                                    Icons.camera_alt,
                                    color: Colors.grey[800],
                                  ),
                                ),
                              ),
                            ),
                          )
                      ),
                      Container(
                          height: 75,
                          width: 75,
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 1.0,
                            ),
                            borderRadius:
                            BorderRadius.all(Radius.circular(5.0)),
                          ),
                          child: Center(
                            child: GestureDetector(
                              onTap: () {
                                _showPicker(context);
                              },
                              child: Container(
                                // radius: 55,
                                // backgroundColor: Color(0xffFDCF09),
                                child: _image != null
                                    ? Image.file(
                                  _image,
                                  width: 100,
                                  height: 100,
                                  fit: BoxFit.fitHeight,
                                )
                                    : Container(
                                  decoration: BoxDecoration(
                                      color:  Color(0xFFE5F3FD),
                                      borderRadius: BorderRadius.circular(0)),
                                  width: 100,
                                  height: 100,
                                  child: Icon(
                                    Icons.camera_alt,
                                    color: Colors.grey[800],
                                  ),
                                ),
                              ),
                            ),
                          )
                      ),
                      Container(
                          height: 75,
                          width: 75,
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 1.0,
                            ),
                            borderRadius:
                            BorderRadius.all(Radius.circular(5.0)),
                          ),
                          child: Center(
                            child: GestureDetector(
                              onTap: () {
                                _showPicker(context);
                              },
                              child: Container(
                                // radius: 55,
                                // backgroundColor: Color(0xffFDCF09),
                                child: _image != null
                                    ? Image.file(
                                  _image,
                                  width: 100,
                                  height: 100,
                                  fit: BoxFit.fitHeight,
                                )
                                    : Container(
                                  decoration: BoxDecoration(
                                      color:  Color(0xFFE5F3FD),
                                      borderRadius: BorderRadius.circular(0)),
                                  width: 100,
                                  height: 100,
                                  child: Icon(
                                    Icons.camera_alt,
                                    color: Colors.grey[800],
                                  ),
                                ),
                              ),
                            ),
                          )
                      ),
                    ],
                  ),
                  SizedBox(height: 5,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Back Shot', style:TextStyle(fontSize: 11,fontWeight: FontWeight.w600, letterSpacing: 1.1),),
                      Text('Box Label', style:TextStyle(fontSize: 11,fontWeight: FontWeight.w600, letterSpacing: 1.1),),
                      Text('Extras ', style:TextStyle(fontSize: 11,fontWeight: FontWeight.w600, letterSpacing: 1.1),),
                      Text('Other', style:TextStyle(fontSize: 11,fontWeight: FontWeight.w600, letterSpacing:1.1),),
                    ],
                  ),
                  SizedBox(height: 40,),
                  InkWell(
                    onTap:(){
                      // Navigator.of(context).push(
                      //     MaterialPageRoute(
                      //         builder: (_) => cart3()));
                    },
                    child: Container(
                      width:  MediaQuery.of(context).size.width/1.07,
                      height: 45,
                      margin: EdgeInsets.only(bottom: 5),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: Text(
                        'ADD',
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w800,
                            fontStyle: FontStyle.normal,
                            fontFamily: 'aveh',
                            letterSpacing: 0.11,
                            fontSize: 12.0),
                      ),
                    ),
                  ),
                  SizedBox(height: 30,),

                ],
              ),
            ),
          ),
        )
    );
  }


  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(Icons.photo_library),
                      title: new Text('Photo Library'),
                      onTap: () {
                        _imgFromGallery();
                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera),
                    title: new Text('Camera'),
                    onTap: () {
                      _imgFromCamera();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        }
    );
  }
}

