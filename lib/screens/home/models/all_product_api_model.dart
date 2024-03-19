class AllProductApiModel{
  int id;
  String name;
  String price;
  String description;
  String stock;
  AllProductApiModel(
      {required this.name,
      required this.id,
      required this.price,
      required this.description,
      required this.stock,});

  factory AllProductApiModel.fromjson(Map json) => AllProductApiModel(
      id: json['id'],
      name: json['title'].toString(),
      price: json['price'].toString(),
      description: json['description'].toString(),
      stock: json['stock'].toString(),);
}
