// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ProductModel {
  String? id;
  List<String>? images;
  String? name;
  int? quantity;
  double? price;
  double? promoPrice;
  // double? unitPrice;
  int? qtePerEmbalage;
  String? embalage;
  String? unit;
  String? type;
  String? category;
  ProductModel(
      {this.id,
      this.images,
      this.name,
      this.quantity,
      this.price,
      this.type,
      // this.unitPrice,
      this.qtePerEmbalage,
      this.embalage,
      this.category,
      this.unit,
      this.promoPrice});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'images': images,
      'label': name,
      'type': type,
      'quantity': quantity,
      'price': price,
      'promoPrice': promoPrice,
      'qtePerEmbalage': qtePerEmbalage,
      'embalage': embalage,
      'unit': unit,
      'category': category,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id'] != null ? map['id'] as String : null,
      images: map['imageUrls'] != null
          ? List<String>.from((map['imageUrls'] as List<String>))
          : null,
      name: map['label'] != null ? map['label'] as String : null,
      quantity: map['quantity'] != null ? map['quantity'] as int : null,
      price: map['price'] != null ? map['price'] as double : null,
      promoPrice: map['promoPrice'],
      qtePerEmbalage:
          map['qtePerEmbalage'] != null ? map['qtePerEmbalage'] as int : null,
      embalage: map['embalage'] != null ? map['embalage'] as String : null,
      unit: map['unit'] != null ? map['unit'] as String : null,
      type: map['type'] as String?,
      category: map['category'] as String?,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) =>
      ProductModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
