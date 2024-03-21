import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_tutorial_app/screens/home/models/fakestore_api_model.dart';
import 'package:flutter_bloc_tutorial_app/screens/wishlist/ui/wish_list_screen.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistInitial()) {
    on<WishListInitialEvent>(wishListInitialEvent);
  }

  FutureOr<void> wishListInitialEvent(WishListInitialEvent event, Emitter<WishlistState> emit) {
    emit(WishlistSuccesState(wishlistItems: wishListItems));
  }
}
