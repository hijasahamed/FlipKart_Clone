import 'package:flutter/material.dart';
import 'package:flutter_bloc_tutorial_app/screens/home/bloc/home_bloc.dart';
import 'package:flutter_bloc_tutorial_app/screens/home/models/fakestore_api_model.dart';
import 'package:flutter_bloc_tutorial_app/screens/home/ui/app_bar_screen.dart';
class ListViewFakeStoreProducts extends StatelessWidget {
  final HomeBloc homeBloc;
  final HomeLoadedSuccessState value;
  final Size size;
  const ListViewFakeStoreProducts({super.key,required this.homeBloc,required this.size,required this.value}); 

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: MyAppBar(homeBloc: homeBloc, buttonsOn: false),
      body: ListView.builder(        
        itemCount: value.fakeStoreProducts.length,
        itemBuilder: (context, index) {
          final FakeStoreApiModel  val=value.fakeStoreProducts[index];
          final double discount=double.parse(val.price);
          final discountOfferRate=discount-2;
          final dropAmount=discount~/2.floor();
          return Padding(
            padding: const EdgeInsets.all(4),
            child: Column(
              children: [
                Stack(
                  children:[ 
                    GestureDetector(
                      onTap: () {                        
                        homeBloc.add(FakeStoreSingleProductPageNavigateEvent(data: val));
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
                                image: DecorationImage(image: NetworkImage(val.imageurl))
                              ),
                            ),
                            SizedBox(width: size.width/40,),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(val.name,style: const TextStyle(fontWeight: FontWeight.bold),maxLines: 1,overflow: TextOverflow.ellipsis,),
                                  Text('₹${val.price}',style: const TextStyle(fontWeight: FontWeight.bold)),
                                  Text('Offer Price ₹$discountOfferRate',style: const TextStyle(color: Colors.green,fontWeight: FontWeight.bold),),
                                   Text('⬇️ $dropAmount% Drop on Price Grab it ASAP'),
                                  const Text('Free delivery 🚚'),
                                  const Text('more offers >')
                                ],
                              ),
                            ),
                          ],
                        )
                      ),
                    ),
                    Positioned( 
                      left: 350,
                      top: 105,
                      child: IconButton(
                        onPressed: (){
                          homeBloc.add(HomeProductWishlistButtonClickedEvent(clickedProduct: val,));
                        }, 
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