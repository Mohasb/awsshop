class Product {
  final int? id;
  final String? name;
  final double? price;
  final String? description;
  final List<Media>? media;
  final int? stock;
  final String? sku;
  final String? status; 
  final int? categoryId;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Product({
    this.id,
    this.name,
    this.price,
    this.description,
    this.media,
    this.stock,
    this.sku,
    this.status,
    this.categoryId,
    this.createdAt,
    this.updatedAt,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] as int?,
      name: json['name'] as String?,
      price: (json['price'] as num?)?.toDouble(),
      description: json['description'] as String?,
      media: (json['media'] as List<dynamic>?)
          ?.map((mediaJson) => Media.fromJson(mediaJson))
          .toList(),
      stock: json['stock'] as int?,
      sku: json['sku'] as String?,
      status: json['status'] as String?,
      categoryId: json['category']?['id'] as int?,
      createdAt: json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null,
      updatedAt: json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : null,
    );
  }
}

class Media {
  final String? url;
  final String? type;

  Media({
    this.url,
    this.type
  });

  factory Media.fromJson(Map<String, dynamic> json) {
    return Media(
      url: json['url'] as String?,
      type: json['type'] as String?,
    );
  }
}
