part of 'wishlist_bloc.dart';

@immutable
abstract class WishlistState {}

abstract class WishlistActionState extends WishlistState {}

class WishlistInitial extends WishlistState {}


class WishlistSuccesState extends WishlistState {
  final List<FakeStoreApiModel> wishlistItems;

  WishlistSuccesState({required this.wishlistItems});
}


class ItemRemovedFromWishListActionState extends WishlistActionState{
  final FakeStoreApiModel data;

  ItemRemovedFromWishListActionState({required this.data});
}