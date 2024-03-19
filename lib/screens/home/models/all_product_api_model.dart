class AllProductApiModel{
  int id;
  String name;
  String price;
  String description;
  String imageUrl;
  AllProductApiModel(
      {required this.name,
      required this.id,
      required this.price,
      required this.description,
      required this.imageUrl
      });

  factory AllProductApiModel.fromjson(Map json) => AllProductApiModel(
      id: json['id'],
      name: json['name'].toString(),
      price: json['updatedAt'].toString(),
      description: json['creationAt'].toString(),
      imageUrl: json['image'].toString()
      );
}
