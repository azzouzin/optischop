class ProductModel {
  int? id;
  List<String>? images;
  String? name;
  int? quantity;
  double? price;
  double? promoPrice;
  double? rating;
  String? reviews;
  String? size;
  bool? isFavorite;
  ProductModel({
    this.id,
    this.images,
    this.name,
    this.quantity,
    this.price,
    this.rating,
    this.reviews,
    this.size,
    this.isFavorite
  });
}