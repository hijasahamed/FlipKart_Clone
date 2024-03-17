import 'package:flutter/material.dart';
import 'package:flutter_bloc_tutorial_app/screens/home/bloc/home_bloc.dart';
import 'package:flutter_bloc_tutorial_app/screens/home/models/api_model.dart';
import 'package:flutter_bloc_tutorial_app/screens/home/ui/app_bar_screen.dart';

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
                  // homeBloc.add(HomeCosmeticSingleProductPageNavigateEvent());
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SingleCosmeticProduct(
                            homeBloc: homeBloc, value: val),
                      ));
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

class SingleCosmeticProduct extends StatelessWidget {
  final HomeBloc homeBloc;
  final ApiModel value;
  const SingleCosmeticProduct(
      {super.key, required this.homeBloc, required this.value});

  @override
  Widget build(BuildContext context) {
    final mediaQuerySize = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: MyAppBar(homeBloc: homeBloc),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Card(
                    elevation: 10,
                    shadowColor: Colors.black,
                    child: Container(
                      height: mediaQuerySize.height / 2,
                      width: mediaQuerySize.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                              image: NetworkImage(value.imageurl),
                              fit: BoxFit.cover,
                              filterQuality: FilterQuality.high)),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 5,
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: (){

                          }, 
                          icon: const Icon(Icons.favorite,color: Colors.red,size: 45,)
                        ),
                        IconButton(
                          onPressed: (){

                          }, 
                          icon: const Icon(Icons.shopping_cart,color: Colors.grey,size: 45,)
                        ),
                      ],
                    )
                  )
                ],
              ),
              Text(value.brand.toUpperCase(),style: const TextStyle(fontSize: 30,fontWeight: FontWeight.bold,fontFamily: 'hijas'),),
              const Divider(),
              Text(value.name.toUpperCase(),style: const TextStyle(fontSize: 22,fontWeight: FontWeight.bold)),                            
              Row(
                children: [
                  Text(
                    value.rating,
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
                  '  ₹ ${value.price}  ',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,fontSize: 20,color: Colors.white),
                ),
              ),
              const SizedBox(height: 5,),
              Text(value.description.trimRight().trimLeft(),style: const TextStyle(fontWeight: FontWeight.bold,fontFamily: 'hijas'),)
            ],
          ),
        ),
      ),
    );
  }
}