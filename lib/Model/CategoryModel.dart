class CategoryModel
{
  var id;
  var name,picture, sliderImage;
  CategoryModel({this.id,this.name,this.picture, this.sliderImage});
}
class CategoryProductModel
{
  var id;
  var name,picture,brand,vendor,status,popular,prices,type, isFavourite, images,shortdesc;
  CategoryProductModel({this.id,this.name,this.picture,this.brand,this.popular,this.status,
    this.vendor,this.prices,this.type, this.isFavourite, this.images, this.shortdesc});
}
class CategoryProductPopularModel
{
  var id;
  var name,picture,brand,vendor,status,popular,prices,type, images, isFavourite, shortdesc;
  CategoryProductPopularModel({this.id,this.name,this.picture,this.brand,this.popular,this.status,
    this.vendor,this.prices,this.type,this.images, this.isFavourite, this.shortdesc});
}