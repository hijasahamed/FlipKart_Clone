import 'package:flutter/material.dart';
import 'package:flutter_bloc_tutorial_app/screens/home/bloc/home_bloc.dart';
import 'package:flutter_bloc_tutorial_app/screens/home/ui/app_bar_screen.dart';

class ListviewAllProductsCategory extends StatelessWidget {
  final HomeBloc homeBloc;
  final Size size;
  final HomeLoadedSuccessState value;
  const ListviewAllProductsCategory(
      {super.key,
      required this.homeBloc,
      required this.size,
      required this.value});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(homeBloc: homeBloc, buttonsOn: false),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              children: List.generate(value.allProducts.length-1, (index) {
                final val = value.allProducts[index];
                return Padding(
                  padding:
                      const EdgeInsets.only(left: 5, top: 5, bottom: 5, right: 1),
                  child: SizedBox(
                      child: Row(
                    children: [
                      Container(
                        height: size.height / 8,
                        width: size.width / 3,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                              image: NetworkImage(val.imageUrl), fit: BoxFit.cover),
                        ),
                      ),
                      SizedBox(
                        width: size.width / 20,
                      ),
                      Column(
                        children: [
                          Text(
                            'Category : ${val.name}',
                            style: const TextStyle(
                                fontSize: 20,
                                fontFamily: 'hijas',
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      )
                    ],
                  )),
                ); 
              }),
            ),
            Column(
              children: List.generate(value.products.length-1, (index) {
                final val = value.products[index];
                return Padding(
                  padding:
                      const EdgeInsets.only(left: 5, top: 5, bottom: 5, right: 1),
                  child: SizedBox(
                      child: Row(
                    children: [
                      Container(
                        height: size.height / 8,
                        width: size.width / 3,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                              image: NetworkImage(val.imageUrl), fit: BoxFit.cover),
                        ),
                      ),
                      SizedBox(
                        width: size.width / 20,
                      ),
                      Column(
                        children: [
                          Text(
                            'Category : ${val.name}',
                            style: const TextStyle(
                                fontSize: 20,
                                fontFamily: 'hijas',
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      )
                    ],
                  )),
                ); 
              }),
            ),
          ],
        ),
      ),
    );
  }
}
