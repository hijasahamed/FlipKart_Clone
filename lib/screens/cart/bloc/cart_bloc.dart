import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_tutorial_app/api_service/api_service.dart';
import 'package:flutter_bloc_tutorial_app/screens/home/models/fakestore_api_model.dart';

part 'cart_event.dart';
part 'cart_state.dart';

List<FakeStoreApiModel> cartItems=[];

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<CartInitialEvent>(cartInitialEvent);
    on<RemoveFromCartEvent>(removeFromCartEvent);
  }

  FutureOr<void> cartInitialEvent(CartInitialEvent event, Emitter<CartState> emit)async {
    final fakeStorevalues = await fetchFakeStoreApiData();
    emit(CartSuccessState(cartItems: cartItems,fakeStoreProducts: fakeStorevalues));
  }

  FutureOr<void> removeFromCartEvent(RemoveFromCartEvent event, Emitter<CartState> emit) {
    cartItems.remove(event.removeValue);
    emit(CartSuccessState(cartItems: cartItems,));
  }
}
