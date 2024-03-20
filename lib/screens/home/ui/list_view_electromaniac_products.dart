import 'package:flutter/material.dart';
import 'package:flutter_bloc_tutorial_app/screens/home/bloc/home_bloc.dart';
import 'package:flutter_bloc_tutorial_app/screens/home/models/electro_maniac_model.dart';
import 'package:flutter_bloc_tutorial_app/screens/home/ui/app_bar_screen.dart';
import 'package:flutter_bloc_tutorial_app/screens/home/ui/cosmetic_widget.dart';
import 'package:flutter_bloc_tutorial_app/screens/home/ui/single_product_tile_widget.dart';
List<String> images=[];
class ListviewElectroManiacProducts extends StatelessWidget {
  final HomeBloc homeBloc;
  final dynamic value;
  final Size size;
  const ListviewElectroManiacProducts({super.key,required this.homeBloc,required this.size,required this.value});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(homeBloc: homeBloc, buttonsOn: false),
      body: ListView.builder(        
        itemCount: value.electroManiaProducts.length,
        itemBuilder: (context, index) {
          final ElectroManiacModel  val=value.electroManiaProducts[index];
          final image=images[index];
          final discount=int.parse(val.price);
          final discountOfferRate=discount-2000;
          final dropAmount=discount~/502.floor();
          return Padding(
            padding: const EdgeInsets.all(4),
            child: Column(
              children: [
                Stack(
                  children:[ 
                    GestureDetector(
                      onTap: () {
                        
                        homeBloc.add(ElectroManiacSingleProductPageNavigateEvent(data: val, img: image));
                      },
                      child: SizedBox(
                        height: size.height/5.8,
                        width: size.width,
                        child: Row(
                          children: [
                            Container(                        
                              height: size.height/8,
                              width: size.width/3,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),                          
                                image: DecorationImage(image: NetworkImage('$baseurl$image'))
                              ),
                            ),
                            SizedBox(width: size.width/40,),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(val.name,style: const TextStyle(fontWeight: FontWeight.bold)),
                                Text('₹${val.price}',style: const TextStyle(fontWeight: FontWeight.bold)),
                                Text('Offer Price ₹$discountOfferRate',style: const TextStyle(color: Colors.green,fontWeight: FontWeight.bold),),
                                Text('⬇️ $dropAmount% Drop on Price Grab it ASAP'),
                                const Text('Free delivery 🚚'),
                                const Text('more offers >')
                              ],
                            ),
                          ],
                        )
                      ),
                    ),
                    Positioned( 
                      left: 350,
                      top: 105,
                      child: IconButton(
                        onPressed: (){}, 
                        icon: const Icon(Icons.favorite_border,color: Colors.grey,)
                      )
                    )
                  ]
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

apiImageAccess(item){
   for (int i = 0; i < item.length; i++) {
      for (int j = 0; j < item[i]['Imagepath'].length;) {
        images.add(item[i]['Imagepath'][j]);
        break;
      }
    }
}

const baseurl='https://electromania.tech/';