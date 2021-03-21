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
      backgroundColor: Color(0xff000000) ,radius: 20,),


  ),
  ColorList(

    dest: CircleAvatar(
        radius: 20,
        backgroundColor: Color(0xffD5D5D5),
        child: CircleAvatar (backgroundColor: Color(0xffFFFFFF) ,
          radius: 20,)
    ),

  ),
  ColorList(

    dest: CircleAvatar(backgroundColor: Color(0xffFF6565) ,radius: 20,),

  ),
  ColorList(

    dest: CircleAvatar(backgroundColor: Color(0xffE3F575) ,radius: 20,),

  ),
  ColorList(

    dest: CircleAvatar(backgroundColor: Color(0xff62C46C) ,radius: 20,),

  ),
  ColorList(

    dest: CircleAvatar(backgroundColor: Color(0xff62C46C) ,radius: 20,),

  ),
  ColorList(

    dest: CircleAvatar(backgroundColor: Color(0xff62C46C) ,radius: 20,),

  ),
];