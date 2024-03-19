part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class HomeInitialEvent extends HomeEvent{}

class HomeProductWishlistButtonClickedEvent extends HomeEvent{

}

class HomeProductCartButtonClickedEvent extends HomeEvent{
  
}

class HomeWishlistNavigateEvent extends HomeEvent{
  
}

class HomeCartNavigateEvent extends HomeEvent{
  
}

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