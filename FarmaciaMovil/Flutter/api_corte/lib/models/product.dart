class Product {
  final int id; // Agregado el atributo id
  final int supplierId;
  final double price;
  final double discount;
  final String brand;
  final String name;
  final String photo;
  final String description;
  final String expirationDate;
  final int stock;
  final int categoryId;

  Product({
    required this.id, // Asegúrate de proporcionar un id en el constructor
    required this.supplierId,
    required this.price,
    required this.discount,
    required this.brand,
    required this.name,
    required this.photo,
    required this.description,
    required this.expirationDate,
    required this.stock,
    required this.categoryId,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'], // Extraer el id del JSON
      supplierId: json['supplier_id'],
      price: (json['price'] is String) ? double.parse(json['price']) : json['price'].toDouble(),
      discount: (json['discount'] is String) ? double.parse(json['discount']) : json['discount'].toDouble(),
      brand: json['brand'],
      name: json['name'],
      photo: json['photo'],
      description: json['description'],
      expirationDate: json['expiration_date'],
      stock: json['stock'],
      categoryId: json['category_id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id, // Agregar id al JSON
      'supplier_id': supplierId,
      'price': price,
      'discount': discount,
      'brand': brand,
      'name': name,
      'photo': photo,
      'description': description,
      'expiration_date': expirationDate,
      'stock': stock,
      'category_id': categoryId,
    };
  }
}
