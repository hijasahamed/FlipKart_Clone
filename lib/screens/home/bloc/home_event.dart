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

// class HomeCosmeticSingleProductPageNavigateEvent extends HomeEvent{

// }