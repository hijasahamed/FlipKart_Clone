import 'package:flutter/material.dart';
import 'package:flutter_bloc_tutorial_app/screens/home/bloc/home_bloc.dart';

class ApiGrid extends StatelessWidget {
  HomeBloc homeBloc;
  HomeLoadedSuccessState value;
  ApiGrid({super.key,required this.homeBloc,
    required this.value,});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      itemCount: value.apiproducts.length-5,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 1,
            mainAxisSpacing: 5,
            crossAxisSpacing: 5,
            crossAxisCount: 1), 
      itemBuilder: ((context, index) {
        final val=value.apiproducts[index];
        return Container(
          height: 75,
          width: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(width: .5,color: Colors.brown,style: BorderStyle.solid),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(val.imageurl)
            )
          ),
        );
      })
    );
  }
}