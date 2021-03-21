import 'package:flutter/material.dart';


class ColorList {
  var dest;




  ColorList({
    @required this.dest,
  });
}

List<ColorList> colorList = [
  ColorList(

    dest: CircleAvatar(
      backgroundColor: Colors.blue ,radius: 20,),


  ),
  ColorList(

    dest: CircleAvatar(
        radius: 20,
        // backgroundColor: Color(0xffD5D5D5),
        child: CircleAvatar (backgroundColor: Colors.red ,
          radius: 20,)
    ),

  ),
  ColorList(

    dest: CircleAvatar(backgroundColor: Colors.orange ,radius: 20,),

  ),
  ColorList(

    dest: CircleAvatar(backgroundColor: Colors.green ,radius: 20,),

  ),
  ColorList(

    dest: CircleAvatar(backgroundColor: Colors.purple ,radius: 20,),

  ),
  ColorList(

    dest: CircleAvatar(backgroundColor: Colors.pink ,radius: 20,),

  ),
  ColorList(

    dest: CircleAvatar(backgroundColor:Colors.black ,radius: 20,),

  ),
  ColorList(

    dest: CircleAvatar(backgroundColor:Colors.white ,radius: 20,),

  ),
];
