class Product {
  final int? id;
  final String? name;
  final double? price;
  final String? description;
  final String? glbUrl;
  final String? image;
  final int? stock;
  final String? sku;
  final String? status;
  final int? categoryId;

  Product({
    this.id,
    this.name,
    this.price,
    this.description,
    this.glbUrl,
    this.image,
    this.stock,
    this.sku,
    this.status,
    this.categoryId,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] as int?,
      name: json['name'] as String?,
      price: (json['price'] as num?)?.toDouble(),
      description: json['description'] as String?,
      glbUrl: json['glbUrl'] as String?,
      image: json['image'] as String?,
      stock: json['stock'] as int?,
      sku: json['sku'] as String?,
      status: json['status'] as String?,
      categoryId: json['categoryId'] as int?,
    );
  }
}
