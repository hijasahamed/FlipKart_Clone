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
  final List<FakeStoreApiModel> fakeStoreProducts;
  final List<AllProductApiModel> allProducts;
  HomeLoadedSuccessState({required this.products,required this.purchasedProducts,required this.apiproducts,required this.electroManiaProducts,
  required this.fakeStoreProducts,required this.allProducts});
}

class HomeErrorState extends HomeState{}

class HomeNavigateToWishListPageActionState extends HomeActionState{}

class HomeNavigateToCartPageActionState extends HomeActionState{}

class HomeNavigateToCosmeticSingleProductPageActionState extends HomeActionState{
final ApiModel data;

  HomeNavigateToCosmeticSingleProductPageActionState({required this.data});
}

class HomeNavigateProductTileToElectroManiacListViewPageActionState extends HomeActionState{
  final dynamic data;
  final Size size;
  final HomeBloc homebloc;
  HomeNavigateProductTileToElectroManiacListViewPageActionState({required this.data,required this.size,required this.homebloc});
}

class HomeNavigateProductTileToFakeStoreListViewPageActionState extends HomeActionState{
  final dynamic data;
  final Size size;
  final HomeBloc homebloc;

  HomeNavigateProductTileToFakeStoreListViewPageActionState({required this.data, required this.size, required this.homebloc});
}


class NavigateToFakeStoreSingleProductPageActionState extends HomeActionState{
final FakeStoreApiModel data;

  NavigateToFakeStoreSingleProductPageActionState({required this.data});
}


class NavigateToElectroManiaSingleProductPageActionState extends HomeActionState{
final ElectroManiacModel data;
final String img;
  NavigateToElectroManiaSingleProductPageActionState({required this.data,required this.img});
}