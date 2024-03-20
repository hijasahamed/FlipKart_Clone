import 'package:flutter/material.dart';
import 'package:flutter_bloc_tutorial_app/screens/home/bloc/home_bloc.dart';
import 'package:flutter_bloc_tutorial_app/screens/home/models/home_product_data_model.dart';

class ProductTileWidget extends StatelessWidget {
  final HomeBloc homeBloc;
  final ProductsDataModel productDataModel;
  final bool container;
  final bool? isElectroManiaclistViewScreen;
  final bool? isFakeStoreListView;
  final Size size;
  final HomeLoadedSuccessState value;
  final int? circleIndex;
  const ProductTileWidget(
      {super.key,
      required this.productDataModel,
      required this.container,
      this.isElectroManiaclistViewScreen,
      required this.homeBloc,
      required this.size,
      required this.value,
      this.isFakeStoreListView,
      this.circleIndex,
      });

  @override
  Widget build(BuildContext context) {
    return container == false
        ? GestureDetector(
          onTap: () {
              homeBloc.add(NavigateToAllProductCategoryPageEvent(data: value));
          },
          child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(32, 123, 124, 123),
                      borderRadius: BorderRadius.circular(50)),
                  child: Padding(
                    padding: const EdgeInsets.all(2),
                    child: CircleAvatar(
                      backgroundColor: Colors.black,
                      radius: 35,
                      child: Container(
                        width: double.maxFinite,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: NetworkImage(productDataModel.imageUrl),
                                fit: BoxFit.cover)),
                      ),
                    ),
                  ),
                ),
                Text(
                  productDataModel.name,
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
              ],
            ),
        )
        : GestureDetector(
            onTap: () {
              if (isElectroManiaclistViewScreen == true) {
                homeBloc.add(
                    HomeNavigateProductTileToElectroManiacListViewPageEvent(
                        data: value, size: size, homeBloc: homeBloc));
              }
              if(isFakeStoreListView==true){
                homeBloc.add(HomeNavigateProductTileToFakeStoreListViewPageEvent(data:value,homeBloc: homeBloc,size: size ));
              }
            },
            child: Column(
              children: [
                Container(
                  height: size.height / 4.2,
                  width: size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        width: 1,
                      ),
                      image: DecorationImage(
                          image: NetworkImage(productDataModel.imageUrl),
                          fit: BoxFit.cover)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 51, 117, 117),
                              borderRadius: BorderRadius.circular(5)),
                          child: Text(
                            productDataModel.name,
                            style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          )),
                      const SizedBox(
                        height: 3,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 51, 117, 117),
                            borderRadius: BorderRadius.circular(5)),
                        child: Text(
                          productDataModel.price,
                          style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
              ],
            ),
          );
  }
}
