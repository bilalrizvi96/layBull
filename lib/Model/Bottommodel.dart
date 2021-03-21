import 'package:flutter/cupertino.dart';
import 'package:freelance2/Offers/Offer.dart';

import '../PopularProduct.dart';
import '../account.dart';
import '../welcome.dart';

class bottom
{
  var nav;
  bool icon;

  bottom({this.nav, this.icon});
}
List <bottom> check=[
  bottom(nav:welcome(),icon:false),
  bottom(nav:PopularProduct(),icon:false),
  bottom(nav:offer(),icon:false),
  bottom(nav:Account(),icon:false),
];