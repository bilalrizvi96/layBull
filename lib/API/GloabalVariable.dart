//login
import 'package:flutter/material.dart';
import 'package:freelance2/Model/BrandModel.dart';
import 'package:freelance2/Model/CategoryModel.dart';
import 'package:freelance2/Model/Product.dart';
import 'package:freelance2/Model/SearchModel.dart';
import 'package:freelance2/Model/favourite.dart';
import 'package:progress_dialog/progress_dialog.dart';

import '../main.dart';

var username,password;

//mainHeader
var client_secret="VpySHRJ0AWaayjOCVcur3URFzPQ2Q4JdDAltWtxp";
var client_id = 2;
var grant_type="password";
var success;
var refresh;
ProgressDialog pr;
//category
List<CategoryModel> category=new List();
List<CategoryProductModel> categoryproduct=new List();
List<CategoryProductPopularModel> categoryproductsPopular=new List();
var dropdowncat=[];
//SearchProduct
List<Product> searchs=[];
List<Product> product=[];
List<Product> popularproduct=[];
List<Product> sentOffer=[];
List<Product> userproduct=[];
List<Favourite> wishlist= Favourite.decodeMusics(MyApp.sharedPreferences.getString("wishlist"));
List<Product> wishlistshow= Product.decodeMusics(MyApp.sharedPreferences.getString("wishlistshow"));
List<Product> recivedorder=[];
List<Brand> brands=new List();

List<Image> image=new List();