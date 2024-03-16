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
      shrinkWrap: true,
      itemCount: value.apiproducts.length-1,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 1,
            mainAxisSpacing: 5,
            crossAxisSpacing: 5,
            crossAxisCount: 2), 
      itemBuilder: ((context, index) {
        final val=value.apiproducts[index];
        return Container(
          height: 100,
          width: 150,
          decoration: BoxDecoration(
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