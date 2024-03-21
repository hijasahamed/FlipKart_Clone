part of 'cart_bloc.dart';

@immutable
abstract class CartState {}

abstract class CartActionState extends CartState{}

final class CartInitial extends CartState {}

class CartSuccessState extends CartState{
  final List<FakeStoreApiModel> cartItems;

  CartSuccessState({required this.cartItems});
}

class ItemRemovedFromCartActionState extends CartActionState{
  final FakeStoreApiModel data;

  ItemRemovedFromCartActionState({required this.data});
}


