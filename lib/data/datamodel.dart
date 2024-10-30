class Product {
  int id;
  String name;
  double price;
  String image;

  String get imageUrl =>
      "https://firtman.github.io/coffeemasters/api/images/$image";

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.image,
  });

  // Factory Constructor
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      price: json['price'],
      image: json['image'],
    );
  }
}

class Category {
  String name;
  List<Product> products;

  Category({required this.name, required this.products});

  // Factory Constructor
  factory Category.fromJson(Map<String, dynamic> json) {
    var productsJson = json['products'] as Iterable<dynamic>;
    var products = productsJson.map((p) => Product.fromJson(p)).toList();
    return Category(name: json['name'] as String, products: products);
  }
}

class ItemCart {
  Product product;
  int quantity;

  ItemCart({required this.product, required this.quantity});
}
