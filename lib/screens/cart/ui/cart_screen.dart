import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_tutorial_app/screens/cart/bloc/cart_bloc.dart';
import 'package:flutter_bloc_tutorial_app/screens/cart/ui/cart_tile.dart';
import 'package:flutter_bloc_tutorial_app/screens/home/bloc/home_bloc.dart';
import 'package:lottie/lottie.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final CartBloc cartBloc = CartBloc();
  @override
  void initState() {
    cartBloc.add(CartInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 250, 249, 249),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'My Cart',
          style: TextStyle(
              fontWeight: FontWeight.w500,
              color: Colors.blue,
              fontStyle: FontStyle.italic),
        ),
        backgroundColor: Colors.yellow,
      ),
      body: BlocConsumer<CartBloc, CartState>(
        bloc: cartBloc,
        listener: (context, state) {},
        listenWhen: (previous, current) => current is CartActionState,
        buildWhen: (previous, current) => current is! CartActionState,
        builder: (context, state) {
          switch (state.runtimeType) {
            // case CartLoadingState:
            //   return const Center(
            //     child: CircularProgressIndicator(
            //       strokeWidth: 4,
            //       color: Colors.blue,
            //     ),
            //   );
            case CartSuccessState:
              final successState = state as CartSuccessState;
              if (successState.cartItems.isEmpty) {
                return Column(
                  children: [
                    SizedBox(
                      height: size.height / 2,
                      width: size.width,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          LottieBuilder.asset(
                            'assets/animations/empty cart.json',
                            height: size.height / 3.5,
                            fit: BoxFit.cover,
                          ),
                          const Text(
                            'Your cart is empty!',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 19),
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue,
                                shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)),
                            ),
                            child: const Text(
                              'Shop now',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 5,right: 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Suggested products',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                            GestureDetector(
                              onTap: () {
                                
                              },
                              child: SizedBox(
                                height: size.height / 4,
                                width: size.width,
                                child: GridView.builder(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemCount: successState.fakeStoreProducts?.length,
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                          childAspectRatio: 1.66,
                                          mainAxisSpacing: 1,
                                          crossAxisSpacing: 1,
                                          crossAxisCount: 1),
                                  itemBuilder: (context, index) {
                                    final val = successState.fakeStoreProducts![index];
                                    return Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Card(
                                          elevation: 5,
                                          child: Container(
                                            height: size.height / 7,
                                            width: size.width / 4,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(10),
                                                image: DecorationImage(
                                                    fit: BoxFit.cover,
                                                    filterQuality: FilterQuality.high,
                                                    image: NetworkImage(val.imageurl))),
                                          ),
                                        ),
                                        Text(
                                          val.name,
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black),
                                        ),
                                        Text(
                                          '₹ ${val.price}',
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black ),
                                        )
                                      ],
                                    );
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                );
              } else {
                return ListView.separated(
                    itemBuilder: (context, index) {
                      return CartTile(
                        cartBlock: cartBloc,
                        size: size,
                        value: state.cartItems[index],
                      );
                    },
                    separatorBuilder: (context, index) => const Divider(),
                    itemCount: state.cartItems.length);
              }
          }
          return const SizedBox();
        },
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              '₹235',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
            ),
            Container(
              height: 45,
              width: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.amber,
              ),
              child: const Center(
                child: Text(
                  'Place Order',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
