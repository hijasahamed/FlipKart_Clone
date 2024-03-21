import 'package:flutter/material.dart';
import 'package:flutter_bloc_tutorial_app/screens/cart/bloc/cart_bloc.dart';
import 'package:flutter_bloc_tutorial_app/screens/home/models/fakestore_api_model.dart';

class CartTile extends StatelessWidget {
  final CartBloc cartBlock;
  final FakeStoreApiModel value;
  final Size size;
  const CartTile({super.key,required this.cartBlock,required this.size,required this.value});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.only(left: 10,right: 10,top: 5,bottom: 5),
        child: Column(
          children: [
            Stack(children: [
              SizedBox(
                  height: size.height /5.9,
                  width: size.width,
                  child: Row(
                    children: [
                      Container(
                        height: size.height / 10,
                        width: size.width / 4,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                                image: NetworkImage(value.imageurl))),
                      ),
                      SizedBox(
                        width: size.width / 40,
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              value.name,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text('₹${value.price}',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                    ],
                  )),
              Positioned(
                  left: 350,
                  top: 105,
                  child: IconButton(
                      onPressed: () {
                        cartBlock.add(RemoveFromCartEvent(removeValue: value));
                      },
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.grey,
                      )))
            ]),
          ],
        ),
      ),
    );
  }
}