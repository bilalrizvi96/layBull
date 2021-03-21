import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Slide {
  var destination;
  var image;
  var imageNIke;
  var des;
  var des2;
  var des3;

  Slide({
    @required this.destination,
    @required this.image,
    @required this.des,
    @required this.des2,
    @required this.des3,
    @required this.imageNIke,
  });
}

List<Slide> slideList = [
  Slide(

    destination: 'SHOES',
    image: 'assets/SHOE.png',
    imageNIke: 'assets/nike.png',
    des: Text(
      'Air Jordan 1 Dior',
    ),
    des2: Text(
      '425 AED',
      style: TextStyle(color: Colors.black),
    ),
    des3: Text('Used'),
  ),
  Slide(
    //  id: 1,
    imageNIke: 'assets/nike.png',
    destination: 'JEANS',
    image: 'assets/JEANS.png',
    des: Text('Air Jordan 1 Dior'),
    des2: Text('500 AED'),
    des3: Text('Used'),
  ),
];




