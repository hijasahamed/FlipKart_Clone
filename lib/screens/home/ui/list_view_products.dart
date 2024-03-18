import 'package:flutter/material.dart';
import 'package:flutter_bloc_tutorial_app/screens/home/bloc/home_bloc.dart';
import 'package:flutter_bloc_tutorial_app/screens/home/models/electro_maniac_model.dart';
import 'package:flutter_bloc_tutorial_app/screens/home/ui/app_bar_screen.dart';
List<String> images=[];
class ListviewProducts extends StatelessWidget {
  final HomeBloc homeBloc;
  final dynamic value;
  final Size? size;
  const ListviewProducts({super.key,required this.homeBloc,required this.size,required this.value});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(homeBloc: homeBloc, buttonsOn: false),
      body: ListView.builder(        
        itemCount: value.electroManiaProducts.length,
        itemBuilder: (context, index) {
          final ElectroManiacModel  val=value.electroManiaProducts[index];
          final image=images[index];
          return Padding(
            padding: const EdgeInsets.all(5),
            child: Column(
              children: [
                Container(
                  height: size!.height/5.8,
                  width: size!.width,
                  child: Row(
                    children: [
                      Container(                        
                        height: size!.height/8,
                        width: size!.width/3,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(image: NetworkImage('$baseurl$image'))
                        ),
                        child: Text(val.name),
                      ),
                      const Column(
                        children: [
                          Text('Syam'),
                          Text('Sinina'),
                          Text('666Rishal'),
                          Text('Basi'),
                          Text('Arshad'),
                        ],
                      )
                    ],
                  )
                ),
                const Divider()
              ],
            ),
          );
        },
      )
    );
  }
}

hello(item){
   for (int i = 0; i < item.length; i++) {
      for (int j = 0; j < item[i]['Imagepath'].length;) {
        images.add(item[i]['Imagepath'][j]);
        break;
      }
    }
}
const baseurl='https://electromania.tech/';