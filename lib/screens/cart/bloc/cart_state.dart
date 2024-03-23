part of 'cart_bloc.dart';

@immutable
abstract class CartState {}

abstract class CartActionState extends CartState{}

final class CartInitial extends CartState {}

class CartLoadingState extends CartState{}

class CartSuccessState extends CartState{
  final List<FakeStoreApiModel> cartItems;
  final List<FakeStoreApiModel>? fakeStoreProducts;

  CartSuccessState({required this.cartItems,this.fakeStoreProducts});
}

class ItemRemovedFromCartActionState extends CartActionState{
  final FakeStoreApiModel data;

  ItemRemovedFromCartActionState({required this.data});
}


