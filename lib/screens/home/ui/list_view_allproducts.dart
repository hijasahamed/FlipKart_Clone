import 'package:flutter/material.dart';
import 'package:flutter_bloc_tutorial_app/screens/home/bloc/home_bloc.dart';
import 'package:flutter_bloc_tutorial_app/screens/home/ui/app_bar_screen.dart';


// List <String> imageList=[];


class ListviewAllProducts extends StatelessWidget {
  final HomeBloc homeBloc;
  final Size size;
  final HomeLoadedSuccessState value;
  const ListviewAllProducts(
      {super.key,
      required this.homeBloc,
      required this.size,
      required this.value});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(homeBloc: homeBloc, buttonsOn: false),
      body: ListView.builder(
        itemCount: value.allProducts.length-2,
        itemBuilder: (context, index) {
          final val = value.allProducts[index];
          // final img=imageList[index];
          return Container(
              child: Column(
            children: [
              Container(
                height: size.height / 8,
                width: size.width / 3,
                decoration: BoxDecoration(
                    image: DecorationImage(image: NetworkImage(val.imageUrl))),
              ),
              Text(val.name),
              Text(val.price),
              Text(val.description),
              const Divider(),
            ],
          ));
        },
      ),
    );
  }
}

// allProductImage(item){
//   for (int i = 0; i < item.length; i++) {
//       for (int j = 0; j < item[i]['images'].length;) {
//         imageList.add(item[i]['images'][j]);
//         break;
//       }
//     }
//     print('List Images = ${imageList}');
// }

// const baseurl='https://api.escuelajs.co/api/v1/products';
