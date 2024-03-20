import 'package:flutter/material.dart';
import 'package:flutter_bloc_tutorial_app/screens/home/bloc/home_bloc.dart';
import 'package:flutter_bloc_tutorial_app/screens/home/ui/app_bar_screen.dart';
import 'package:flutter_bloc_tutorial_app/screens/home/ui/list_view_electromaniac_products.dart';

class SingleProductTileWidget extends StatelessWidget {
  final HomeBloc homeBloc;
  final dynamic value;
  final bool electroMania;
  final String? img;
  const SingleProductTileWidget(
      {super.key,
      required this.homeBloc,
      this.value,
      required this.electroMania,
      this.img});

  @override
  Widget build(BuildContext context) {
    final mediaQuerySize = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: MyAppBar(homeBloc: homeBloc, buttonsOn: false),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.favorite_border,
                        
                        size: 25,
                      )),
                  const SizedBox(
                    width: 10,
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.shopping_cart_outlined,
                        
                        size: 25,
                      )),
                ],
              ),
              Card(
                elevation: 10,
                shadowColor: Colors.black,
                child: Container(
                  height: mediaQuerySize.height / 2.1,
                  width: mediaQuerySize.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                          image: electroMania
                              ? NetworkImage('$baseurl$img')
                              : NetworkImage(value!.imageurl),
                          fit: BoxFit.cover,
                          filterQuality: FilterQuality.high)),
                ),
              ),
              Text(value!.name.toUpperCase(),
                  style: const TextStyle(
                      fontSize: 22, fontWeight: FontWeight.bold)),
              const Divider(),
              Text(
                value!.brand.toUpperCase(),
                style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'hijas'),
              ),
              Row(
                children: [
                  Text(
                    value!.rating,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: const TextStyle(
                        color: Colors.green, fontWeight: FontWeight.bold),
                  ),
                  const Icon(
                    Icons.star,
                    color: Colors.green,
                    size: 20,
                  )
                ],
              ),
              ColoredBox(
                color: Colors.blueGrey,
                child: Text(
                  '  ₹ ${value!.price}  ',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                value!.description.trimRight().trimLeft(),
                style: const TextStyle(
                    fontWeight: FontWeight.bold, fontFamily: 'hijas'),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              width: mediaQuerySize.width / 2.5,
              decoration: BoxDecoration(
                border: Border.all(width: .5),
                borderRadius: BorderRadius.circular(0),
              ),
              alignment: Alignment.center,
              child: const Text(
                'Add to Cart',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
            ),
            Container(
              width: mediaQuerySize.width / 2.5,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(0), color: Colors.amber),
              alignment: Alignment.center,
              child: const Text(
                'Buy Now',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
