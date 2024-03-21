part of 'wishlist_bloc.dart';

@immutable
abstract class WishlistEvent {}

class WishListInitialEvent extends WishlistEvent{

}

class RemoveFromWishlist extends WishlistEvent{
  
}