class FakeStoreApiModel {
  int id;
  String name;
  String price;
  String imageurl;
  String description;
  String rating;
  FakeStoreApiModel(
      {required this.name,
      required this.id,
      required this.rating,
      required this.price,
      required this.description,
      required this.imageurl});

  factory FakeStoreApiModel.fromjson(Map json) => FakeStoreApiModel(
      id: json['id'],
      name: json['title'].toString(),
      rating: json['rating'].toString(),
      price: json['price'].toString(),
      description: json['description'].toString(),
      imageurl: json['image'].toString());
}
