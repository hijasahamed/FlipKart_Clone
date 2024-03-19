class FakeStoreApiModel {
  int id;
  String name;
  String price;
  String imageurl;
  String description;
  String rating;
  String brand;
  FakeStoreApiModel(
      {required this.name,
      required this.id,
      required this.rating,
      required this.price,
      required this.description,
      required this.imageurl,
      required this.brand
      });

  factory FakeStoreApiModel.fromjson(Map json) => FakeStoreApiModel(
      id: json['id'],
      name: json['title'].toString(),
      rating: json['rating'].toString(),
      price: json['price'].toString(),
      description: json['description'].toString(),
      imageurl: json['image'].toString(),
      brand: json['category'].toString(),);
}
