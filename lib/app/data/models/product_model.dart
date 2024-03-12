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
  // double? unitPrice;
  int? qtePerEmbalage;
  String? embalage;
  String? unit;
  bool? isFavorite;
  ProductModel(
      {this.id,
      this.images,
      this.name,
      this.quantity,
      this.price,
      // this.unitPrice,
      this.qtePerEmbalage,
      this.rating,
      this.reviews,
      this.size,
      this.embalage,
      this.unit,
      this.isFavorite,
      this.promoPrice});
}
