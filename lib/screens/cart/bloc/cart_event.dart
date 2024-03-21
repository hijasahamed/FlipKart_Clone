part of 'cart_bloc.dart';

@immutable
abstract class CartEvent {}

class CartInitialEvent extends CartEvent{}


class RemoveFromCartEvent extends CartEvent{
  final FakeStoreApiModel removeValue;

  RemoveFromCartEvent({required this.removeValue});
}