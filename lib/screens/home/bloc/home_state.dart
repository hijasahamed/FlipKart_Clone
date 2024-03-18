part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

abstract class HomeActionState extends HomeState{}

class HomeInitial extends HomeState {}

class HomeLoadingState extends HomeState{}

class HomeLoadedSuccessState extends HomeState{
  final List<ProductsDataModel> products;
  final List<ProductsDataModel> purchasedProducts;
  final List<ApiModel> apiproducts;
  final List<ElectroManiacModel> electroManiaProducts;
  HomeLoadedSuccessState({required this.products,required this.purchasedProducts,required this.apiproducts,required this.electroManiaProducts,});
}

class HomeErrorState extends HomeState{}

class HomeNavigateToWishListPageActionState extends HomeActionState{}

class HomeNavigateToCartPageActionState extends HomeActionState{}

class HomeNavigateToCosmeticSingleProductPageActionState extends HomeActionState{
final ApiModel data;
  HomeNavigateToCosmeticSingleProductPageActionState({required this.data});
}