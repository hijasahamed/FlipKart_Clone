import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_tutorial_app/api_service/api_service.dart';
import 'package:flutter_bloc_tutorial_app/screens/cart/ui/cart_screen.dart';
import 'package:flutter_bloc_tutorial_app/screens/home/bloc/home_bloc.dart';
import 'package:flutter_bloc_tutorial_app/screens/home/ui/cosmetic_widget.dart';
import 'package:flutter_bloc_tutorial_app/screens/home/ui/carousel_slider_screen.dart';
import 'package:flutter_bloc_tutorial_app/screens/home/ui/lottie_watch_screen.dart';
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
    getallproducts();    
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
            final mediaQuerySize=MediaQuery.sizeOf(context);
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
                padding:  const EdgeInsets.all(4),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 5),
                        child: CarouselSliderScreen(size: mediaQuerySize),
                      ),
                      GridView.builder(
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
                      const Divider(),
                      LottieWidgetScreen(size:mediaQuerySize),
                      const Divider(),
                      ProductTileWidget(
                        productDataModel: successState.purchasedProducts[1],
                        value: true,
                      ),
                      ProductTileWidget(
                        productDataModel: successState.purchasedProducts[0],
                        value: true,
                      ),
                      const Divider(),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(width: .5),
                          color: const Color.fromARGB(255, 3, 28, 41),
                          boxShadow: const [
                            BoxShadow(
                              color: Color.fromARGB(162, 83, 88, 4),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: Offset(0,1)
                            )
                          ]
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 5,right: 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(top: 5,bottom: 5),
                                child: ColoredBox(
                                  color: Colors.lime,
                                  child: Text(' Flat 20% Off for Cosmetics ',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,fontFamily: 'hijas'),)),
                              ),
                              SizedBox(
                                height: mediaQuerySize.height/4.6,
                                width: mediaQuerySize.width,
                                child: CosmeticWidget(homeBloc: homeBloc, value: successState,size: mediaQuerySize,)
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Divider(),
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
