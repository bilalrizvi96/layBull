import 'package:flutter/material.dart';


class SlideBRand {
  var dest;

  var imageNIke;


  SlideBRand({
    @required this.dest,
    @required this.imageNIke,
  });
}

List<SlideBRand> slideBrand = [
  SlideBRand(

    dest: 'NIKE',

    imageNIke: 'assets/nike.png',

  ),
  SlideBRand(

    imageNIke: 'assets/Addidas.png',
    dest: 'ADDIDAS',

  ),
  SlideBRand(

    imageNIke: 'assets/puma.png',
    dest: 'ADDIDAS',

  ),
];
