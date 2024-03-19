class ElectroManiacModel {
  String id;
  String name;
  String price;
  String description;
  ElectroManiacModel(
      {required this.name,
      required this.id,
      required this.price,
      required this.description,
     });

  factory ElectroManiacModel.fromjson(Map json) => ElectroManiacModel(
      id: json['_id'],
      name: json['Productname'].toString(),
      price: json['Price'].toString(),
      description: json['Description'].toString(),
      );
}
