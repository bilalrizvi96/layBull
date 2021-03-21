import 'dart:convert';

class Favourite{
  var id;


  Favourite({
        this.id,
      });


  factory Favourite.fromJson(Map<String, dynamic> jsonData) {
    return Favourite(
      id: jsonData['id'],
    );
  }

  static Map<String, dynamic> toMap(Favourite cart) => {
    'id': cart.id,
  };

  static String encodeMusics(List<Favourite> cart) => json.encode(
    cart
        .map<Map<dynamic, dynamic>>((music) => Favourite.toMap(music))
        .toList(),
  );

  static List<Favourite> decodeMusics(String musics){
    if(musics != null){
      return (json.decode(musics) as List<dynamic>)
          .map<Favourite>((item) => Favourite.fromJson(item))
          .toList();
    }else{
      return new List();
    }

  }


}