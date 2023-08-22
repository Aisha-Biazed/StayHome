part of 'my_cart_cubit.dart';

@immutable
class MyCartState {
  List<ProductCart> productsCart;

  MyCartState({required this.productsCart});
}

class ProductCart {
  ProductCart({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.cost,
    required this.counter,
  });

  @override
  String toString() {
    return 'ProductCart{id: $id, name: $name, imageUrl: $imageUrl, cost: $cost, counter: $counter}';
  }

  Map<String, dynamic> toJson() {
    return {
      "productId": id,
      "quantity": counter,
    };
  }

  final String? id;
  final String? name;
  final String? imageUrl;
  final int? cost;
  final int? counter;
}
