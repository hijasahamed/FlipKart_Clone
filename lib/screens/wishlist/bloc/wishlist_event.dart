part of 'wishlist_bloc.dart';

@immutable
abstract class WishlistEvent {}

class WishListInitialEvent extends WishlistEvent{

}

class RemoveFromWishlistEvent extends WishlistEvent{
  final FakeStoreApiModel removeValue;

  RemoveFromWishlistEvent({required this.removeValue});
  
}