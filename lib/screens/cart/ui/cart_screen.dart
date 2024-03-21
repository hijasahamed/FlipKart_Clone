import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_tutorial_app/screens/cart/bloc/cart_bloc.dart';
import 'package:flutter_bloc_tutorial_app/screens/cart/ui/cart_tile.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final CartBloc cartBloc=CartBloc();
  @override
  void initState() {
    cartBloc.add(CartInitialEvent());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'My Cart',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: Colors.blue,
            fontStyle: FontStyle.italic
          ),
        ),
        backgroundColor: Colors.yellow,
      ),
      body: BlocConsumer<CartBloc,CartState>(
        bloc: cartBloc,
        listener: (context, state) {},
        listenWhen: (previous, current) => current is CartActionState,
        buildWhen: (previous, current) => current is !CartActionState,
        builder: (context, state) {
          // if(cartItems.isEmpty){
          //   return const Center(child: Text('No items Added',style: TextStyle(fontWeight: FontWeight.bold),));
          // }
          switch (state.runtimeType){
            case CartSuccessState:
            final successState= state as CartSuccessState;
            return ListView.separated(
              itemBuilder: (context, index) {
                return CartTile(
                  cartBlock: cartBloc,
                  size: size,
                  value: successState.cartItems[index],
                );
              }, 
              separatorBuilder:(context, index) => const Divider(),
              itemCount: successState.cartItems.length
            );
          }
          return const SizedBox();
        },        
      ),
    );
  }
}
