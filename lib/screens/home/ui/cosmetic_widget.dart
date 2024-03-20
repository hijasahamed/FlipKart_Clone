import 'package:flutter/material.dart';
import 'package:flutter_bloc_tutorial_app/screens/home/bloc/home_bloc.dart';

class CosmeticWidget extends StatelessWidget {
  final HomeBloc homeBloc;
  final HomeLoadedSuccessState value;
  final Size size;
  const CosmeticWidget(
      {super.key,
      required this.homeBloc,
      required this.value,
      required this.size});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: value.apiproducts.length - 1,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 1,
            mainAxisSpacing: 5,
            crossAxisSpacing: 5,
            crossAxisCount: 1),
        itemBuilder: ((context, index) {
          final val = value.apiproducts[index];
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  homeBloc.add(HomeCosmeticSingleProductPageNavigateEvent(data: val));              
                },
                child: Container(
                  height: size.height / 7,
                  width: size.width / 2,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          width: .5,
                          color: Colors.brown,
                          style: BorderStyle.solid),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          filterQuality: FilterQuality.high,
                          image: NetworkImage(val.imageurl))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 5, left: 5, right: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      val.name,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    Text(
                      '₹ ${val.price}',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    Row(
                      children: [
                        Text(
                          val.rating,
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
                  ],
                ),
              )
            ],
          );
        }));
  }
}

