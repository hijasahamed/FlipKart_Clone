class ElectroManiacModel {
  String id;
  String name;
  String price;
  String description;
  String brand;
  String rating;
  ElectroManiacModel(
      {required this.name,
      required this.id,
      required this.price,
      required this.description,
      required this.brand,
      required this.rating,
     });

  factory ElectroManiacModel.fromjson(Map json) => ElectroManiacModel(
      id: json['_id'],
      name: json['Productname'].toString(),
      price: json['Price'].toString(),
      description: json['Description'].toString(),
      brand: json['Spec'].toString(),
      rating: json['Stoke'].toString(),
      );
}
