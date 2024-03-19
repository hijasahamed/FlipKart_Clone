import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_tutorial_app/api_service/api_service.dart';
import 'package:flutter_bloc_tutorial_app/screens/home/bloc/home_bloc.dart';
import 'package:flutter_bloc_tutorial_app/screens/home/models/cart/ui/cart_screen.dart';
import 'package:flutter_bloc_tutorial_app/screens/home/ui/app_bar_screen.dart';
import 'package:flutter_bloc_tutorial_app/screens/home/ui/cosmetic_widget.dart';
import 'package:flutter_bloc_tutorial_app/screens/home/ui/carousel_slider_screen.dart';
import 'package:flutter_bloc_tutorial_app/screens/home/ui/list_view_electromaniac_products.dart';
import 'package:flutter_bloc_tutorial_app/screens/home/ui/lottie_watch_screen.dart';
import 'package:flutter_bloc_tutorial_app/screens/home/ui/product_tile_widget.dart';
import 'package:flutter_bloc_tutorial_app/screens/wishlist/ui/wish_list_screen.dart';
import 'package:lottie/lottie.dart';

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
    electroManiaDataFetch();
    fetchFakeStoreApiData();   
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
        else if (state is HomeNavigateToCosmeticSingleProductPageActionState){
          Navigator.push(context,MaterialPageRoute(builder: (context) =>  SingleCosmeticProduct(homeBloc: homeBloc,value: state.data),));
        }
        else if(state is HomeNavigateProductTileToElectroManiacListViewPageActionState){
          Navigator.push(context,MaterialPageRoute(builder: (context) =>  ListviewElectroManiacProducts(homeBloc: homeBloc, size: state.size, value: state.data),));
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
              appBar: MyAppBar(homeBloc: homeBloc,buttonsOn: true),
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
                            container: false,
                            homeBloc: homeBloc,
                            size: mediaQuerySize,
                            value: successState,
                          );
                        },
                        itemCount: successState.products.length,
                      ),
                      const Divider(),
                      LottieWidgetScreen(size:mediaQuerySize),
                      const Divider(),
                      ProductTileWidget(
                        productDataModel: successState.purchasedProducts[4], 
                        container: true,
                        isElectroManiaclistViewScreen: true,
                        homeBloc: homeBloc,
                        size: mediaQuerySize,
                        value: successState,
                      ),
                      ProductTileWidget(
                        productDataModel: successState.purchasedProducts[3],
                        container: true,
                        homeBloc: homeBloc,
                        size: mediaQuerySize,
                        isFakeStoreListView: true,
                        value: successState,
                      ),
                      ProductTileWidget(
                        productDataModel: successState.purchasedProducts[2],
                        container: true,
                        homeBloc: homeBloc,
                        size: mediaQuerySize,
                        value: successState,
                      ),
                      ProductTileWidget(
                        productDataModel: successState.purchasedProducts[1],
                        container: true,
                        homeBloc: homeBloc,
                        size: mediaQuerySize,
                        value: successState,
                      ),
                      ProductTileWidget(
                        productDataModel: successState.purchasedProducts[0],
                        container: true,
                        homeBloc: homeBloc,
                        size: mediaQuerySize,
                        value: successState,
                      ),
                      const Divider(),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(width: .5),
                          color: Colors.black,                         
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 5,right: 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 5,bottom: 5),
                                child: Row(
                                  children: [
                                    const Text(' Flat 20% Off for Cosmetics ',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,fontFamily: 'hijas',color: Colors.white),),
                                    LottieBuilder.asset('assets/animations/Animation - 1710669204067.json',height: mediaQuerySize.height/13,width: mediaQuerySize.width/6,)
                                  ],
                                ), 
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
