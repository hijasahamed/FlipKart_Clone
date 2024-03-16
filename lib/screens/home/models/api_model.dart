class ApiModel {
  int id;
  String name;
  String price;
  String brand;
  String imageurl;
  String description;
  String rating;
  ApiModel(
      {required this.name,
      required this.id,
      required this.brand,
      required this.rating,
      required this.price,
      required this.description,
      required this.imageurl});

  factory ApiModel.fromjson(Map json) => ApiModel(
      id: json['id'],
      name: json['name'].toString(),
      brand: json['brand'].toString(),
      rating: json['rating'].toString(),
      price: json['price'].toString(),
      description: json['description'].toString(),
      imageurl: json['image_link'].toString());
}
