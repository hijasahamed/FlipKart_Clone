import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_tutorial_app/screens/cart/ui/cart_screen.dart';
import 'package:flutter_bloc_tutorial_app/screens/home/bloc/home_bloc.dart';
import 'package:flutter_bloc_tutorial_app/screens/home/ui/grid_count_screen.dart';
import 'package:flutter_bloc_tutorial_app/screens/home/ui/product_tile_widget.dart';
import 'package:flutter_bloc_tutorial_app/screens/home/ui/search_bar.dart';
import 'package:flutter_bloc_tutorial_app/screens/wishlist/ui/wish_list_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    homeBloc.add(HomeInitialEvent());
    super.initState();
  }

  final HomeBloc homeBloc = HomeBloc();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
      listenWhen: (previous, current) => current is HomeActionState,
      buildWhen: (previous, current) => current is! HomeActionState,
      listener: (context, state) {
        if (state is HomeNavigateToCartPageActionState) {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const CartScreen(),
              ));
        } else if (state is HomeNavigateToWishListPageActionState) {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const WishlistScreen(),
              ));
        }
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case HomeLoadingState:
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(
                  strokeWidth: 4,
                  color: Colors.blue,
                ),
              ),
            );
          case HomeLoadedSuccessState:
            final successState = state as HomeLoadedSuccessState;
            return Scaffold(
              backgroundColor: const Color.fromARGB(241, 255, 255, 255),
              appBar: AppBar(               
                title: const Text(
                  'Flopkart',
                  style: TextStyle(
                      fontSize: 25,
                      fontStyle: FontStyle.italic,
                      color: Colors.blue,
                      fontWeight: FontWeight.w500),
                ),
                actions: [
                  IconButton(
                      onPressed: () {
                        homeBloc.add(HomeWishlistNavigateEvent());
                      },
                      icon: const Icon(
                        Icons.favorite,
                        color: Colors.red,
                      )),
                  IconButton(
                      onPressed: () {
                        homeBloc.add(HomeCartNavigateEvent());
                      },
                      icon: const Icon(
                        Icons.shopping_cart,
                        color: Colors.blue,
                      ))
                ],
                bottom: const PreferredSize(
                  preferredSize: Size.fromHeight(60), 
                  child: Search()
                ),
                backgroundColor: Colors.yellow,
              ),
              body: Padding(
                padding: const EdgeInsets.all(4),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const GridCountScreen(),
                      const SizedBox(height: 5,),
                      GridView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                          crossAxisSpacing: 1,
                          mainAxisSpacing: 1,
                        ),
                        itemBuilder: (context, index) {
                          return ProductTileWidget(
                            productDataModel: successState.products[index],
                            value: false,
                          );
                        },
                        itemCount: successState.products.length,
                      ),
                      const Divider(),
                      ProductTileWidget(
                        productDataModel: successState.purchasedProducts[3],
                        value: true,
                      ),
                      ProductTileWidget(
                        productDataModel: successState.purchasedProducts[2],
                        value: true,
                      ),
                      ProductTileWidget(
                        productDataModel: successState.purchasedProducts[1],
                        value: true,
                      ),
                      ProductTileWidget(
                        productDataModel: successState.purchasedProducts[0],
                        value: true,
                      ),
                    ],
                  ),
                ),
              ),
            );
          case HomeErrorState:
            return const Scaffold(
              body: Center(
                child: Text('Error'),
              ),
            );
          default:
            return const SizedBox();
        }
      },
    );
  }
}
