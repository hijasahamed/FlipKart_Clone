import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc_tutorial_app/screens/home/models/all_product_category_api_model.dart';
import 'package:flutter_bloc_tutorial_app/screens/home/models/electro_maniac_model.dart';
import 'package:flutter_bloc_tutorial_app/screens/home/models/fakestore_api_model.dart';
import 'package:flutter_bloc_tutorial_app/screens/home/ui/list_view_electromaniac_products.dart';
import 'package:flutter_bloc_tutorial_app/screens/home/models/api_model.dart';

Future<List<ApiModel>> getAllCosmeticProducts() async {
  const url = 'https://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline';

  Uri uri = Uri.parse(url);
  final respose = await http.get(uri, headers: {'ContentType': 'application/json'});
  final json = jsonDecode(respose.body) as List;

  final result = json.map((e) => ApiModel.fromjson(e)).toList();

  return result;
}

Future<List<FakeStoreApiModel>> fetchFakeStoreApiData()async{
  List<FakeStoreApiModel> res=[];
  try{
    const url='https://fakestoreapi.com/products';
  Uri uri=Uri.parse(url);
  final response=await http.get(uri);
  final json=jsonDecode(response.body)as List;
   res=json.map((e) => FakeStoreApiModel.fromjson(e)).toList();
  
  } catch (e){
    if(kDebugMode){
      print(e);
    }
  }
  return res;
}

Future <List<ElectroManiacModel>> electroManiaDataFetch() async {
  List<ElectroManiacModel> res=[];
  try {
    const url = 'https://electromania.tech/products';
    final uri = Uri.parse(url);
    final respose = await http.get(uri);
    final item = jsonDecode(respose.body) as List;
      res=item.map((e) => ElectroManiacModel.fromjson(e)).toList();
      apiImageAccess(item);
  } catch (e) {
    if (kDebugMode) {
      print(e);
    }
  }
  return res;
}


Future<List<AllProductCategoryApiModel>> allProductApiDataFetching()async{
  List<AllProductCategoryApiModel> res=[];
  try{
    const url='https://api.escuelajs.co/api/v1/categories';
  Uri uri=Uri.parse(url);
  final response=await http.get(uri);
  // print('Hijas Hijas all products ${response.body}');
  final json=jsonDecode(response.body)as List;
   res=json.map((e) => AllProductCategoryApiModel.fromjson(e)).toList();
  //  allProductImage(json);
  } catch (e){
    if(kDebugMode){
      print(e);
    }
  }
  return res;
}
