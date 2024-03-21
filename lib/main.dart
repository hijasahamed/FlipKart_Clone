import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_tutorial_app/screens/cart/bloc/cart_bloc.dart';
import 'package:flutter_bloc_tutorial_app/screens/home/bloc/home_bloc.dart';
import 'package:flutter_bloc_tutorial_app/screens/home/ui/home_screen.dart';
import 'package:flutter_bloc_tutorial_app/screens/wishlist/bloc/wishlist_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => HomeBloc(),),
        BlocProvider(create: (context) => WishlistBloc(),),
        BlocProvider(create: (context) => CartBloc(),)
      ],
      child: MaterialApp(
         title: 'Bloc Tutorial',
         debugShowCheckedModeBanner: false,
         theme: ThemeData.light(),
         home: const HomeScreen(),
      ),
    );
  }
}

