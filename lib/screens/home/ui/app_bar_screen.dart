import 'package:flutter/material.dart';
import 'package:flutter_bloc_tutorial_app/screens/home/bloc/home_bloc.dart';
import 'package:flutter_bloc_tutorial_app/screens/home/ui/search_bar.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final HomeBloc homeBloc;
  const MyAppBar({super.key, required this.homeBloc});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
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
          preferredSize: Size.fromHeight(60), child: Search()),
      backgroundColor: Colors.yellow,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 60);
}
