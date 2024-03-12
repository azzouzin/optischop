import '../app/data/models/product_model.dart';
import 'constants.dart';

class DummyHelper {
  const DummyHelper._();

  static List<ProductModel> products = [
    ProductModel(
      id: 1,

      images: [
        Constants.product1,
        Constants.product2,
        Constants.product2,
        Constants.product2,
      ],
      name: 'Goubllet',
      embalage: "Carton",
      unit: "Paqet",
      // unitPrice: 2000,
      qtePerEmbalage: 200,
      quantity: 0,
      price: 29000,
      promoPrice: 2500,
      rating: 4.5,
      reviews: '1.2k reviews',
      size: 'M',
      isFavorite: false,
    ),
    ProductModel(
        id: 2,
        images: [
          Constants.product2,
        ],
        name: 'The Statement Skirt',
        quantity: 0,
        price: 79.99,
        rating: 4.4,
        reviews: '10k reviews',
        size: 'M',
        isFavorite: false),
    ProductModel(
        id: 3,
        images: [Constants.product3],
        name: 'The Luxe Sweater',
        quantity: 0,
        price: 129.99,
        rating: 4.3,
        reviews: '22k reviews',
        size: 'M',
        isFavorite: false),
    ProductModel(
        id: 4,
        images: [Constants.product4],
        name: 'The Statement Top',
        quantity: 0,
        price: 59.99,
        rating: 4.2,
        reviews: '3.4k reviews',
        size: 'M',
        isFavorite: false),
    ProductModel(
        id: 5,
        images: [Constants.product5],
        name: 'The Casual Tank',
        quantity: 0,
        price: 39.99,
        rating: 4.1,
        reviews: '2.6k reviews',
        size: 'M',
        isFavorite: false),
    ProductModel(
        id: 6,
        images: [Constants.product1],
        name: 'The Denim Jean',
        quantity: 0,
        price: 59.99,
        rating: 4.0,
        reviews: '5.8k reviews',
        size: 'M',
        isFavorite: false),
  ];
}
