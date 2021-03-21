import 'dart:convert';

class Product
{
  var cat,id,brand,vendor,type,status,popular,name,prices,image,discount,originalprices,tags,pusblish,shortdesc,fulldesc,payment,warrenty,color,images,
        isFavourite, size;

  Product(
      {this.cat,
      this.id,
      this.brand,
      this.vendor,
      this.type,
      this.status,
      this.popular,
      this.name,
      this.prices,
      this.image,
      this.discount,
      this.originalprices,
          this.images,
      this.tags,
      this.pusblish,
      this.shortdesc,
      this.fulldesc,
      this.payment,
      this.warrenty,
      this.color,
      this.isFavourite = false,
          this.size,
  });

  factory Product.fromJson(Map<String, dynamic> jsonData) {

      return Product(
          cat: jsonData['cat'],
          id: jsonData['id'],
          brand: jsonData['brand'],
          vendor: jsonData['vendor'],
          type: jsonData['type'],
          status: jsonData['status'],
          popular: jsonData['popular'],
          name: jsonData['name'],
          prices: jsonData['prices'],
          image: jsonData['image'],
          discount: jsonData['discount'],
          originalprices: jsonData['originalprices'],
          tags: jsonData['tags'],
          pusblish: jsonData['pusblish'],
          shortdesc: jsonData['shortdesc'],
          fulldesc: jsonData['fulldesc'],
          payment: jsonData['payment'],
          warrenty: jsonData['warrenty'],
          color: jsonData['color'],
          isFavourite: jsonData['isFavourite'],
      );
  }

  static Map<String, dynamic> toMap(Product cart) => {
      'cat': cart.cat,
      'id': cart.id,
      'brand': cart.brand,
      'vendor': cart.vendor,
      'type': cart.type,
      'status': cart.status,
      'popular': cart.popular,
      'name': cart.name,
      'prices': cart.prices,
      'image': cart.image,
      'discount': cart.discount,
      'originalprices': cart.originalprices,
      'tags': cart.tags,
      'pusblish': cart.pusblish,
      'shortdesc': cart.shortdesc,
      'fulldesc': cart.fulldesc,
      'payment': cart.payment,
      'warrenty': cart.warrenty,
      'color': cart.color,
      'isFavourite': cart.isFavourite,
  };


  static String encodeMusics(List<Product> cart) => json.encode(
      cart
          .map<Map<dynamic, dynamic>>((music) => Product.toMap(music))
          .toList(),
  );

  static List<Product> decodeMusics(String musics){
      if(musics != null){
          return (json.decode(musics) as List<dynamic>)
              .map<Product>((item) => Product.fromJson(item))
              .toList();
      }else{
          return new List();
      }

  }

}