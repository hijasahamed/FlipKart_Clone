part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class HomeInitialEvent extends HomeEvent{}

class HomeProductWishlistButtonClickedEvent extends HomeEvent{
  final FakeStoreApiModel clickedProduct;
  HomeProductWishlistButtonClickedEvent({required this.clickedProduct,});
}

class HomeProductCartButtonClickedEvent extends HomeEvent{
  final FakeStoreApiModel clickedProduct;

  HomeProductCartButtonClickedEvent({required this.clickedProduct});
}

class HomeWishlistNavigateEvent extends HomeEvent{ }

class HomeCartNavigateEvent extends HomeEvent{}




class HomeCosmeticSingleProductPageNavigateEvent extends HomeEvent{
  final ApiModel data;
  HomeCosmeticSingleProductPageNavigateEvent({required this.data});
}

class HomeNavigateProductTileToElectroManiacListViewPageEvent extends HomeEvent{
  final dynamic data;
  final Size size;
  final HomeBloc homeBloc;
  HomeNavigateProductTileToElectroManiacListViewPageEvent({required this.data,required this.size,required this.homeBloc});
}

class HomeNavigateProductTileToFakeStoreListViewPageEvent extends HomeEvent{
  final dynamic data;
  final Size size;
  final HomeBloc homeBloc;
  HomeNavigateProductTileToFakeStoreListViewPageEvent({required this.data,required this.size,required this.homeBloc});
}


class FakeStoreSingleProductPageNavigateEvent extends HomeEvent{
  final FakeStoreApiModel data;
  FakeStoreSingleProductPageNavigateEvent({required this.data});
}


class ElectroManiacSingleProductPageNavigateEvent extends HomeEvent{
  final ElectroManiacModel data;
  final String img;
  ElectroManiacSingleProductPageNavigateEvent({required this.data,required this.img});
}

class NavigateToAllProductCategoryPageEvent extends HomeEvent{
  final HomeLoadedSuccessState data;

  NavigateToAllProductCategoryPageEvent({required this.data});
}