import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:flutter_bloc_tutorial_app/screens/home/models/api_model.dart';

Future<List<ApiModel>> getallproducts() async {
  const url =
      'https://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline';

  Uri uri = Uri.parse(url);
  print('started');
  final respose =
      await http.get(uri, headers: {'ContentType': 'application/json'});
  print(respose.body);
  final json = jsonDecode(respose.body) as List;

  final result = json.map((e) => ApiModel.fromjson(e)).toList();

  return result;
}
