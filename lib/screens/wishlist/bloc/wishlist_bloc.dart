import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_tutorial_app/screens/home/models/fakestore_api_model.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';

List<FakeStoreApiModel> wishListItems=[];

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistInitial()) {
    on<WishListInitialEvent>(wishListInitialEvent);
    on<RemoveFromWishlistEvent>(removeFromWishlistEvent);
  }

  FutureOr<void> wishListInitialEvent(WishListInitialEvent event, Emitter<WishlistState> emit) {
    emit(WishlistSuccesState(wishlistItems: wishListItems));
  }

  FutureOr<void> removeFromWishlistEvent(RemoveFromWishlistEvent event, Emitter<WishlistState> emit) {
    wishListItems.remove(event.removeValue);
    emit(WishlistSuccesState(wishlistItems: wishListItems));
  }
}
