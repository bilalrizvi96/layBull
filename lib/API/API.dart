import 'dart:io';

import 'package:dio/dio.dart';
import 'package:freelance2/Model/BrandModel.dart';
import 'package:freelance2/Model/CategoryModel.dart';
import 'package:freelance2/Model/Product.dart';
import 'package:freelance2/Model/SearchModel.dart';
import 'package:freelance2/Model/favourite.dart';
import 'package:freelance2/Registration/Login.dart';

import '../main.dart';
import 'BaseUrl.dart';
import 'GloabalVariable.dart';

class API {
  static var complete = "false";
  static var error = "";
  static var paymentlink;
  static Future login(var username, var password) async {

    API.Category();
    //API.getProduct();
    API.getPopularProduct();
    // API.UserProduct();
    API.getBrands();
    API.getRecivedOrder();
    API.getUserdetail();
    complete = "false";

    var url = BaseUrl + "oauth/token";
    Dio dio = new Dio();
    FormData formData = new FormData.fromMap({
      'username': username.toString(),
      'password': password.toString(),
      "client_secret": client_secret.toString(),
      "client_id": "2",
      "grant_type": grant_type.toString(),
    });

    await dio
        .post(
      url,
      data: formData,
      // options: Options(
      //   headers: {"Content-Type": "application/json"},
      //   // headers: {
      //   //   "client_secret":client_secret,
      //   //   "client_id":client_id,
      //   //   "grant_type":grant_type,
      //   // }
      //
      // ),
    )
        .then((response) {
      API.UserProduct();

      print(response);
      //print(month);
      Map<String, dynamic> data = response.data;
      // var records = data['error'];
      // //print(month.toString());
      // print(records);

      if (response.statusCode == 200) {
        success = data['access_token'];
        refresh = data['refresh_token'];
        MyApp.sharedPreferences
            .setString('access_token', data['access_token'].toString());
        MyApp.sharedPreferences
            .setString('refresh_token', data['refresh_token'].toString());
        complete = "true";
        print(data);
        //success = "true";
      } else {
        complete = "false";
        print(response.statusCode);
      }
      //print(response.data);
    }).catchError((e) {
      complete = "true";
      print(e.error);
      print(e);

      if (e.error is SocketException) {
        success = "error";
        print(e.error);
        print(e);
      } else {
        success = "error";
      }
    });
  }

  static Future Sigup(
      var email, var password, var username, var phone, var address) async {
    complete = "false";
    var url = BaseUrl + "api/signup";
    Dio dio = new Dio();
    FormData formData = new FormData.fromMap({
      'name': username.toString(),
      'email': email.toString(),
      'password': password.toString(),
      'phone': phone.toString(),
      'address': address.toString(),
      // "client_secret":client_secret.toString(),
      // "client_id":"2",
      // "grant_type":grant_type.toString(),
    });

    await dio
        .post(
      url,
      data: formData,
      // options: Options(
      //   headers: {"Content-Type": "application/json"},
      //   // headers: {
      //   //   "client_secret":client_secret,
      //   //   "client_id":client_id,
      //   //   "grant_type":grant_type,
      //   // }
      //
      // ),
    )
        .then((response) {
      print(response);
      //print(month);
      Map<String, dynamic> data = response.data;
      // var records = data['error'];
      // //print(month.toString());
      // print(records);

      if (response.statusCode == 200) {
        // success=data['access_token'];
        // refresh=data['refresh_token'];
        // MyApp.sharedPreferences.setString('access_token', data['access_token'].toString());
        // MyApp.sharedPreferences.setString('refresh_token', data['refresh_token'].toString());
        // complete = "true";
        // print(data);
        //success = "true";
      } else {
        complete = "false";
        print(response.statusCode);
      }
      //print(response.data);
    }).catchError((e) {
      complete = "true";
      print(e.error);
      print(e);

      if (e.error is SocketException) {
        success = "error";
        print(e.error);
        print(e);
      } else {
        success = "error";
      }
    });
  }

  static Future Category() async {
    category.clear();
    var url = BaseUrl + "api/categories";
    Dio dio = new Dio();
    await dio
        .get(url,
            options: Options(headers: {
              "token_type": "Bear",
              "access_token":
                  MyApp.sharedPreferences.getString("access_token").toString()
            }))
        .then((response) {
      if (response.statusCode == 200) {
        //vendorList.clear();
        //print(response.data.toString());
        var data = response.data;
        for (Map record in data[0]) {
          category.add(CategoryModel(
              id: record['id'],
              name: record['name'],
              picture: record['picture']));
        }
      } else {
        success = "true";
        throw Exception('Failed to Fetch Vendors');
      }
    });
  }

  static Future CategoryProduct(var param) async {
    complete = "false";
    categoryproductsPopular.clear();
    categoryproduct.clear();
    var url = BaseUrl + "api/categories/" + param.toString();
    Dio dio = new Dio();
    await dio
        .get(url,
            options: Options(
                // headers: {"token_type":"Bear","access_token":success.toString()}
                ))
        .then((response) {
      if (response.statusCode == 200) {
        //vendorList.clear();
        //print(response.data.toString());
        var data = response.data;
        for (Map record in data) {
          for (Map check in record['product']) {
            if (check['popular'] == "1") {
              var contain = wishlist
                  .where((element) => element.id == check['id'].toString());
              if(contain.isNotEmpty){
                categoryproductsPopular.add(CategoryProductPopularModel(
                    id: check['id'],
                    name: check['name'],
                    picture: check['feature_image'],
                    brand: check['brand'],
                    popular: check['popular'],
                    prices: check['price'],
                    images: check['image'],
                    vendor: check['vendor'],
                    shortdesc: check['short_desc'],
                    isFavourite: true,
                    type: check['type']));
              }
              else{
                categoryproductsPopular.add(CategoryProductPopularModel(
                    id: check['id'],
                    name: check['name'],
                    picture: check['feature_image'],
                    brand: check['brand'],
                    popular: check['popular'],
                    prices: check['price'],
                    images: check['image'],
                    vendor: check['vendor'],
                    shortdesc: check['short_desc'],
                    isFavourite: false,
                    type: check['type']));
              }

            }

            var contain = wishlist
                .where((element) => element.id == check['id'].toString());
            if (contain.isNotEmpty) {
              categoryproduct.add(CategoryProductModel(
                id: check['id'],
                name: check['name'],
                picture: check['feature_image'],
                brand: check['brand'],
                popular: check['popular'],
                prices: check['price'],
                images: check['image'],
                vendor: check['vendor'],
                shortdesc: check['short_desc'],
                type: check['type'],
                isFavourite: true,
              ));
            } else {
              categoryproduct.add(CategoryProductModel(
                id: check['id'],
                name: check['name'],
                picture: check['feature_image'],
                brand: check['brand'],
                popular: check['popular'],
                prices: check['price'],
                images: check['image'],
                vendor: check['vendor'],
                shortdesc: check['short_desc'],
                type: check['type'],
                isFavourite: false,
              ));
            }
          }
          complete = "true";
        }
      } else {
        success = "true";
        throw Exception('Failed to Fetch Vendors');
      }
    });
  }

  static Future Search(var name) async {
    searchs.clear();
    complete = "false";
    var url = BaseUrl + "api/searchProduct";
    Dio dio = new Dio();
    FormData formData = new FormData.fromMap({
      'name': name.toString(),
      // "client_secret":client_secret.toString(),
      // "client_id":"2",
      // "grant_type":grant_type.toString(),
    });

    await dio
        .post(
      url,
      data: formData,
      // options: Options(
      //   headers: {"Content-Type": "application/json"},
      //   // headers: {
      //   //   "client_secret":client_secret,
      //   //   "client_id":client_id,
      //   //   "grant_type":grant_type,
      //   // }
      //
      // ),
    )
        .then((response) {
      print(response);
      //print(month);

      // var records = data['error'];
      // //print(month.toString());
      // print(records);

      if (response.statusCode == 200) {
        var data = response.data;
        if (data != []) {
          for (var da in data) {
            searchs.add(Product(
                color: da['color'],
                brand: da['brand'],
                discount: da['discount'],
                id: da['id'],
                name: da['name'],
                prices: da['price'],
                image: da['feature_image'],
                popular: da['popular'],
                type: da['type']));
          }
        }

        complete = "true";
        // success=data['access_token'];
        // refresh=data['refresh_token'];
        // MyApp.sharedPreferences.setString('access_token', data['access_token'].toString());
        // MyApp.sharedPreferences.setString('refresh_token', data['refresh_token'].toString());
        // complete = "true";
        // print(data);
        //success = "true";
      } else {
        complete = "false";
        print(response.statusCode);
      }
      //print(response.data);
    }).catchError((e) {
      complete = "true";
      // print(e.error);
      // print(e);

      // if(e.error is SocketException){
      //   // success = "error";
      //   // print(e.error);
      //   // print(e);
      // }
      // else{
      //   // success = "error";
      // }
    });
  }

  static Future getProduct() async {
    product.clear();
    complete = "false";
    var url = BaseUrl + "api/getProducts";
    Dio dio = new Dio();
    // FormData formData = new FormData.fromMap({
    //   'name': name.toString(),
    //   // "client_secret":client_secret.toString(),
    //   // "client_id":"2",
    //   // "grant_type":grant_type.toString(),
    //
    // });

    await dio
        .get(
      url,
      // options: Options(
      //   headers: {"Content-Type": "application/json"},
      //   // headers: {
      //   //   "client_secret":client_secret,
      //   //   "client_id":client_id,
      //   //   "grant_type":grant_type,
      //   // }
      //
      // ),
    )
        .then((response) {
      print(response);
      //print(month);

      // var records = data['error'];
      // //print(month.toString());
      // print(records);

      if (response.statusCode == 200) {
        var data = response.data;
        if (data != []) {
          for (var da in data) {
            product.add(Product(
                color: da['color'],
                brand: da['brand'],
                discount: da['discount'],
                id: da['id'],
                name: da['name'],
                prices: da['price'],
                image: da['feature_image'],
                popular: da['popular'],
                type: da['type']));
          }
        }

        complete = "true";
        // success=data['access_token'];
        // refresh=data['refresh_token'];
        // MyApp.sharedPreferences.setString('access_token', data['access_token'].toString());
        // MyApp.sharedPreferences.setString('refresh_token', data['refresh_token'].toString());
        // complete = "true";
        // print(data);
        //success = "true";
      } else {
        complete = "false";
        print(response.statusCode);
      }
      //print(response.data);
    }).catchError((e) {
      complete = "true";
      // print(e.error);
      // print(e);

      // if(e.error is SocketException){
      //   // success = "error";
      //   // print(e.error);
      //   // print(e);
      // }
      // else{
      //   // success = "error";
      // }
    });
  }

  static Future getPopularProduct() async {
    popularproduct.clear();
    complete = "false";
    var url = BaseUrl + "api/popularProducts";
    Dio dio = new Dio();
    // FormData formData = new FormData.fromMap({
    //   'name': name.toString(),
    //   // "client_secret":client_secret.toString(),
    //   // "client_id":"2",
    //   // "grant_type":grant_type.toString(),
    //
    // });

    await dio
        .get(
      url,
      // options: Options(
      //   headers: {"Content-Type": "application/json"},
      //   // headers: {
      //   //   "client_secret":client_secret,
      //   //   "client_id":client_id,
      //   //   "grant_type":grant_type,
      //   // }
      //
      // ),
    )
        .then((response) {
      print(response);
      //print(month);

      // var records = data['error'];
      // //print(month.toString());
      // print(records);

      if (response.statusCode == 200) {
        var data = response.data;
        if (data != []) {
          for (var da in data) {
            popularproduct.add(
                Product(
                color: da['color'],
                brand: da['brand'],
                discount: da['discount'],
                id: da['id'],
                name: da['name'],
                prices: da['price'],
                image: da['feature_image'],
                popular: da['popular'],
                images: da['image'],
                shortdesc: da['short_desc'],
                vendor: da['vendor'],
                type: da['type'])
            );
          }
        }

        complete = "true";
        // success=data['access_token'];
        // refresh=data['refresh_token'];
        // MyApp.sharedPreferences.setString('access_token', data['access_token'].toString());
        // MyApp.sharedPreferences.setString('refresh_token', data['refresh_token'].toString());
        // complete = "true";
        // print(data);
        //success = "true";
      } else {
        complete = "false";
        print(response.statusCode);
      }
      //print(response.data);
    }).catchError((e) {
      complete = "true";
      // print(e.error);
      // print(e);

      // if(e.error is SocketException){
      //   // success = "error";
      //   // print(e.error);
      //   // print(e);
      // }
      // else{
      //   // success = "error";
      // }
    });
  }

  static Future setProduct(
      var cat,
      brand,
      vendor,
      type,
      status,
      popular,
      name,
      prices,
      image,
      discount,
      originalprices,
      tags,
      pusblish,
      shortdesc,
      fulldesc,
      payment,
      warrenty,
      color,
      images) async {
    popularproduct.clear();
    complete = "false";
    var url = BaseUrl + "api/addProduct";
    Dio dio = new Dio();
    FormData formData = new FormData.fromMap({
      'name': 'Belts',
      'cat_id': '519',
      'brand_id': '1',
      'price': '200',
      'short_desc': 'These are belts',
      'size': 'M',
      'color': '#f2f2f2'
    });

    await dio
        .post(
      url,
      options:
          Options(headers: {"authorization": "Bearer" + success.toString()}),
      data: formData,
    )
        .then((response) {
      print(response);
      //print(month);

      // var records = data['error'];
      // //print(month.toString());
      // print(records);

      if (response.statusCode == 200) {
        var data = response.data;
        if (data != []) {
          for (var da in data) {
            var contain =
                wishlist.where((element) => element.id == da['id'].toString());
            if (contain.isNotEmpty) {
              popularproduct.add(Product(
                  color: da['color'],
                  brand: da['brand'],
                  discount: da['discount'],
                  id: da['id'],
                  name: da['name'],
                  prices: da['price'],
                  image: da['feature_image'],
                  popular: da['popular'],
                  type: da['type'],
                  isFavourite: true));
            } else {
              popularproduct.add(Product(
                  color: da['color'],
                  brand: da['brand'],
                  discount: da['discount'],
                  id: da['id'],
                  name: da['name'],
                  prices: da['price'],
                  image: da['feature_image'],
                  popular: da['popular'],
                  type: da['type'],
                  isFavourite: false));
            }
          }
        }

        complete = "true";
        // success=data['access_token'];
        // refresh=data['refresh_token'];
        // MyApp.sharedPreferences.setString('access_token', data['access_token'].toString());
        // MyApp.sharedPreferences.setString('refresh_token', data['refresh_token'].toString());
        // complete = "true";
        // print(data);
        //success = "true";
      } else {
        complete = "false";
        print(response.statusCode);
      }
      //print(response.data);
    }).catchError((e) {
      complete = "true";
      // print(e.error);
      // print(e);

      // if(e.error is SocketException){
      //   // success = "error";
      //   // print(e.error);
      //   // print(e);
      // }
      // else{
      //   // success = "error";
      // }
    });
  }

  static Future UserProduct() async {
    userproduct.clear();
    var url = BaseUrl + "api/userProducts";
    Dio dio = new Dio();
    dio.options.headers["authorization"] = "Bearer " +
        MyApp.sharedPreferences.getString("access_token").toString();
    //dio.options.headers["content"] = "token"+success.toString();
    await dio
        .get(
      url,
      //     options: Options(
      //
      //     headers: {
      //
      //       "Authorization":"Bearer"+success.toString()}
      // )
    )
        .then((response) {
      if (response.statusCode == 200) {
        //vendorList.clear();
        //print(response.data.toString());
        var data = response.data;
        if (data != []) {
          for (var data in data) {
            userproduct.add(Product(
                color: data['color'],
                brand: data['brand'],
                discount: data['discount'],
                id: data['id'],
                name: data['name'],
                prices: data['price'],
                image: data['feature_image'],
                popular: data['popular'],
                type: data['type']));
          }
        }
      } else {
        // success = "true";
        throw Exception('Failed to Fetch Vendors');
      }
    });
  }

  // static Future WishList() async
  // {
  //
  //   userproduct.clear();
  //   var url=BaseUrl+"api/wishlist";
  //   Dio dio = new Dio();
  //   dio.options.headers["authorization"] = "Bearer "+MyApp.sharedPreferences.getString("access_token").toString();
  //   //dio.options.headers["content"] = "token"+success.toString();
  //   await dio.get(url,).then((response) {
  //
  //     if(response.statusCode == 200){
  //       //vendorList.clear();
  //       //print(response.data.toString());
  //       var data = response.data;
  //       if(data != []) {
  //         for (var data in data) {
  //           wishlist.add(Favourite(color: data['color'],
  //               brand: data['brand'],
  //               discount: data['discount'],
  //               id: data['id'],
  //               name: data['name'],
  //               prices: data['price'],
  //               image: data['feature_image'],
  //               popular: data['popular'],
  //               type: data['type']));
  //         }
  //       }
  //     }
  //     else{
  //       // success = "true";
  //       throw Exception('Failed to Fetch Vendors');
  //     }
  //
  //   });
  //
  // }

  static Future getBrands() async {
    brands.clear();
    var url = BaseUrl + "api/brands";
    Dio dio = new Dio();
    await dio
        .get(url,
            options: Options(
                // headers: {"token_type":"Bear","access_token":success.toString()}
                ))
        .then((response) {
      if (response.statusCode == 200) {
        //vendorList.clear();
        //print(response.data.toString());
        var data = response.data;
        if (data != []) {
          for (var da in data) {
            brands.add(Brand(
                name: da['name'],
                id: da['id'],
                picture: da['picture'],
                description: da['description']));
          }
        }
      } else {
        //   success = "true";
        throw Exception('Failed to Fetch Vendors');
      }
    });
  }

  static Future getRecivedOrder() async {
    recivedorder.clear();
    var url = BaseUrl + "api/receivedOffers";
    Dio dio = new Dio();
    dio.options.headers["authorization"] = "Bearer " +
        MyApp.sharedPreferences.getString("access_token").toString();
    await dio
        .get(url,
        options: Options(
           //headers: {"token_type":"Bear","access_token":success.toString()}
        ))
        .then((response) {
      if (response.statusCode == 200) {
        //vendorList.clear();
        //print(response.data.toString());
        var data = response.data;
        if (data != []) {
          for (var da in data) {
            recivedorder.add(Product(
                color: da['color'],
                brand: da['brand'],
                discount: da['discount'],
                id: da['id'],
                name: da['name'],
                prices: da['price'],
                image: da['feature_image'],
                popular: da['popular'],
                images: da['image'],
                shortdesc: da['short_desc'],
                size: da['size'],
                type: da['type']));
          }
        }
      } else {
        //   success = "true";
        throw Exception('Failed to Fetch Vendors');
      }
    });
  }

  static Future getUserdetail() async {
    recivedorder.clear();
    var url = BaseUrl + "api/user";
    Dio dio = new Dio();
    dio.options.headers["authorization"] = "Bearer " +
        MyApp.sharedPreferences.getString("access_token").toString();
    await dio
        .get(url,
        options: Options(
          //headers: {"token_type":"Bear","access_token":success.toString()}
        ))
        .then((response) {
      if (response.statusCode == 200) {
        //vendorList.clear();
        //print(response.data.toString());
        var data = response.data;
        MyApp.sharedPreferences.setString('user_name', data['name'].toString());
        MyApp.sharedPreferences.setString('user_id', data['id'].toString());
        MyApp.sharedPreferences.setString('user_email', data['email'].toString());
      } else {
        //   success = "true";
        throw Exception('Failed to Fetch Vendors');
      }
    });
  }

  static Future Bid( var vendor_id,var product_id, var bid_Price) async {
    sentOffer.clear();
    API.getRecivedOrder();
    complete = "false";
    var url = BaseUrl + "api/bidProduct";
    Dio dio = new Dio();
    dio.options.headers["authorization"] = "Bearer " +
        MyApp.sharedPreferences.getString("access_token").toString();
    FormData formData = new FormData.fromMap({
      'product_id': int.parse(product_id.toString()),
      'price': int.parse(bid_Price.toString()),
      'seller_id': int.parse(vendor_id.toString()),
    });

    await dio
        .post(
      url,
      data: formData,
    )
        .then((response) {
      if (response.statusCode == 200) {
        var data = response.data['products'];
        print("sdfsgjksdgkjhfdjk "+response.data.toString());
        if (data != []) {
          for (var da in data) {
            sentOffer.add(
                Product(
                    color: da['color'],
                    brand: da['brand'],
                    discount: da['discount'],
                    id: da['id'],
                    name: da['name'],
                    prices: da['price'],
                    image: da['feature_image'],
                    popular: da['popular'],
                    images: da['image'],
                    shortdesc: da['short_desc'],
                    vendor: da['vendor'],
                    size: da['size'],
                    type: da['type'])
            );
          }
        }

        complete = "true";
        //success = "true";
      }

    }).catchError((e) {
      complete = "true";

      if (e.error is SocketException) {
        success = "error";
        print(e.error);
        print(e);
      } else {
        success = "error";
      }
    });
  }



  static Future payment( var amount,var email,) async {
    sentOffer.clear();
    API.getRecivedOrder();
    complete = "false";
    var url = BaseUrl + "api/payment";
    Dio dio = new Dio();
    // dio.options.headers["authorization"] = "Bearer " +
    //     MyApp.sharedPreferences.getString("access_token").toString();
    FormData formData = new FormData.fromMap({
      'amount': int.parse(amount.toString()),
      'email': email.toString(),
    });

    await dio
        .post(
      url,
      data: formData,
    )
        .then((response) {
      if (response.statusCode == 200) {
        paymentlink = response.data['payment_link'];

        complete = "true";
        //success = "true";
      }

    }).catchError((e) {
      complete = "true";

      if (e.error is SocketException) {
        success = "error";
        print(e.error);
        print(e);
      } else {
        success = "error";
      }
    });
  }


  static Future Cypheme( var vendor_id,var product_id, var bid_Price) async {
    sentOffer.clear();
    API.getRecivedOrder();
    complete = "false";
    var url = BaseUrl + "api/bidProduct";
    Dio dio = new Dio();
    dio.options.headers["authorization"] = "Bearer " +
        MyApp.sharedPreferences.getString("access_token").toString();
    FormData formData = new FormData.fromMap({
      'product_id': int.parse(product_id.toString()),
      'price': int.parse(bid_Price.toString()),
      'seller_id': int.parse(vendor_id.toString()),
    });

    await dio
        .post(
      url,
      data: formData,
    )
        .then((response) {
      if (response.statusCode == 200) {
        var data = response.data['products'];
        print("sdfsgjksdgkjhfdjk "+response.data.toString());
        if (data != []) {
          for (var da in data) {
            sentOffer.add(
                Product(
                    color: da['color'],
                    brand: da['brand'],
                    discount: da['discount'],
                    id: da['id'],
                    name: da['name'],
                    prices: da['price'],
                    image: da['feature_image'],
                    popular: da['popular'],
                    images: da['image'],
                    shortdesc: da['short_desc'],
                    vendor: da['vendor'],
                    size: da['size'],
                    type: da['type'])
            );
          }
        }

        complete = "true";
        //success = "true";
      }

    }).catchError((e) {
      complete = "true";

      if (e.error is SocketException) {
        success = "error";
        print(e.error);
        print(e);
      } else {
        success = "error";
      }
    });
  }
}
