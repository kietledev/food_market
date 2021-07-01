class FoodModel {
  String? foodId = '';
  String? foodName = '';
  List<ImageModel>? images = <ImageModel>[];
  String? description = '';
  int? price = 0;
  String? cateId = '';
  String? cateName = '';
  String? createdAt = '';
  String? updatedAt = '';
  FoodModel(
      {this.foodId,
      this.foodName,
      this.images,
      this.description,
      this.price,
      this.cateId,
      this.cateName,
      this.createdAt,
      this.updatedAt});
  factory FoodModel.fromJson(Map<String, dynamic> jsonMap) {
    List<ImageModel> listImage = <ImageModel>[];
    if (jsonMap['images'] != null) {}
    return FoodModel(
        foodId: jsonMap['foodId'],
        foodName: jsonMap['foodName'],
        images: List<ImageModel>.from(
            jsonMap['images'].map((x) => ImageModel.fromJson(x))),
        description: jsonMap['description'],
        price: jsonMap['price'],
        cateId: jsonMap['cateId'],
        cateName: jsonMap['cateName'],
        createdAt: jsonMap['createdAt'],
        updatedAt: jsonMap['updatedAt']);
  }
}

class ImageModel {
  String? imageUrl;
  ImageModel({this.imageUrl});

  factory ImageModel.fromJson(Map<String, dynamic> jsonMap) {
    return ImageModel(imageUrl: jsonMap['imageUrl']);
  }
}
