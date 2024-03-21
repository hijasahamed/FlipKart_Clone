import 'package:flutter/material.dart';
import 'package:flutter_bloc_tutorial_app/screens/home/models/fakestore_api_model.dart';
import 'package:flutter_bloc_tutorial_app/screens/wishlist/bloc/wishlist_bloc.dart';
import 'package:flutter_bloc_tutorial_app/screens/wishlist/ui/wish_list_screen.dart';

class WishlistTile extends StatelessWidget {
  final WishlistBloc wishlistBlock;
  final FakeStoreApiModel value;
  final Size size;
  const WishlistTile(
      {super.key,
      required this.wishlistBlock,
      required this.value,
      required this.size});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: Column(
        children: [
          Stack(children: [
            SizedBox(
                height: size.height /5.9,
                width: size.width,
                child: Row(
                  children: [
                    Container(
                      height: size.height / 8,
                      width: size.width / 3,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
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
                      // wishListItems.remove(value);
                      
                    },
                    icon: const Icon(
                      Icons.favorite_border,
                      color: Colors.grey,
                    )))
          ]),
        ],
      ),
    );
  }
}
