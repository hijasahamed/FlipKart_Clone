import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_tutorial_app/screens/wishlist/bloc/wishlist_bloc.dart';
import 'package:flutter_bloc_tutorial_app/screens/wishlist/ui/wishlist_tile.dart';



class WishlistScreen extends StatefulWidget {
  const WishlistScreen({super.key});
  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}
class _WishlistScreenState extends State<WishlistScreen> {
  final WishlistBloc wishlistBloc=WishlistBloc(); 
  @override
  void initState() {
    wishlistBloc.add(WishListInitialEvent());
    super.initState();
  }
  @override
  Widget build(BuildContext context) { 
    final size = MediaQuery.sizeOf(context);   
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'WishList',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: Colors.blue,
            fontStyle: FontStyle.italic
          ),
        ),
        backgroundColor: Colors.yellow,
      ),
      body: BlocConsumer<WishlistBloc,WishlistState>(
        bloc: wishlistBloc,
        listener: (context, state) {},
        listenWhen: (previous, current) => current is WishlistActionState,
        buildWhen: (previous, current) => current is !WishlistActionState,
        builder:(context, state) {          
          switch (state.runtimeType){
            case WishlistSuccesState:
            final successState =state as WishlistSuccesState;
            if(successState.wishlistItems.isEmpty){
              return const Center(child: Text('No items in wishlist',style: TextStyle(fontWeight: FontWeight.bold),));
            }
            return ListView.separated(
              separatorBuilder: (context, index) => const Divider(),
              itemCount: successState.wishlistItems.length,
              itemBuilder: (context, index) {
                return WishlistTile(
                  wishlistBlock: wishlistBloc,
                  value: successState.wishlistItems[index],
                  size: size,
                );
              },
              
            );
          }
          return const SizedBox();
        }, 
      ),
    );
  }
}