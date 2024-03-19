import 'dart:async';

import 'package:bloc/bloc.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_tutorial_app/api_service/api_service.dart';

import 'package:flutter_bloc_tutorial_app/data/grocery_data.dart';
import 'package:flutter_bloc_tutorial_app/data/purchase_products.dart';
import 'package:flutter_bloc_tutorial_app/screens/home/models/all_product_api_model.dart';
import 'package:flutter_bloc_tutorial_app/screens/home/models/api_model.dart';
import 'package:flutter_bloc_tutorial_app/screens/home/models/electro_maniac_model.dart';
import 'package:flutter_bloc_tutorial_app/screens/home/models/fakestore_api_model.dart';

import 'package:flutter_bloc_tutorial_app/screens/home/models/home_product_data_model.dart';

import 'package:meta/meta.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialEvent>(homeInitialEvent);

    on<HomeProductWishlistButtonClickedEvent>(
        homeProductWishlistButtonClickedEvent);

    on<HomeProductCartButtonClickedEvent>(homeProductCartButtonClickedEvent);

    on<HomeWishlistNavigateEvent>(homeWishlistNavigateEvent);

    on<HomeCartNavigateEvent>(homeCartNavigateEvent);

    on<HomeCosmeticSingleProductPageNavigateEvent>(
        homeCosmeticSingleProductPageNavigateEvent);

    on<HomeNavigateProductTileToElectroManiacListViewPageEvent>(
        homeNavigateProductTileToListViewPageEvent);

    on<HomeNavigateProductTileToFakeStoreListViewPageEvent>(
        homeNavigateProductTileToFakeStoreListViewPageEvent);
  }

  FutureOr<void> homeInitialEvent(
      HomeInitialEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());

    await Future.delayed(const Duration(milliseconds: 1800));

    final values = await getAllCosmeticProducts();

    final electroManiacValues = await electroManiaDataFetch();

    final fakeStorevalues = await fetchFakeStoreApiData();

    final allProductsValue = await allProductApiDataFetching();

    emit(HomeLoadedSuccessState(
      products: Grocerydata.groceryProduct
          .map((e) => ProductsDataModel(
              id: e['id'],
              name: e['name'],
              description: e['description'],
              price: e['price'],
              imageUrl: e['imageUrl']))
          .toList(),
      purchasedProducts: PurchaseProducts.purchaseProducts
          .map((e) => ProductsDataModel(
              id: e['id'],
              name: e['name'],
              description: e['description'],
              price: e['price'],
              imageUrl: e['imageUrl']))
          .toList(),
      apiproducts: values,
      electroManiaProducts: electroManiacValues,
      fakeStoreProducts: fakeStorevalues,
      allProducts: allProductsValue
    ));
  }

  FutureOr<void> homeProductWishlistButtonClickedEvent(
      HomeProductWishlistButtonClickedEvent event, Emitter<HomeState> emit) {
    if (kDebugMode) {
      print('Product added to wishlisted');
    }
  }

  FutureOr<void> homeProductCartButtonClickedEvent(
      HomeProductCartButtonClickedEvent event, Emitter<HomeState> emit) {
    if (kDebugMode) {
      print('Product added to Cart');
    }
  }

  FutureOr<void> homeWishlistNavigateEvent(
      HomeWishlistNavigateEvent event, Emitter<HomeState> emit) {
    if (kDebugMode) {
      print('Navigating to Wishlist');
    }

    emit(HomeNavigateToWishListPageActionState());
  }

  FutureOr<void> homeCartNavigateEvent(
      HomeCartNavigateEvent event, Emitter<HomeState> emit) {
    if (kDebugMode) {
      print('Navigating to Cart');
    }

    emit(HomeNavigateToCartPageActionState());
  }

  FutureOr<void> homeCosmeticSingleProductPageNavigateEvent(
      HomeCosmeticSingleProductPageNavigateEvent event,
      Emitter<HomeState> emit) {
    if (kDebugMode) {
      print('Navigating to single cosmetic page');
    }
    emit(HomeNavigateToCosmeticSingleProductPageActionState(data: event.data));
  }

  FutureOr<void> homeNavigateProductTileToListViewPageEvent(
      HomeNavigateProductTileToElectroManiacListViewPageEvent event,
      Emitter<HomeState> emit) {
    emit(HomeNavigateProductTileToElectroManiacListViewPageActionState(
        data: event.data, size: event.size, homebloc: event.homeBloc));
  }

  FutureOr<void> homeNavigateProductTileToFakeStoreListViewPageEvent(
      HomeNavigateProductTileToFakeStoreListViewPageEvent event,
      Emitter<HomeState> emit) {
        emit(HomeNavigateProductTileToFakeStoreListViewPageActionState(data: event.data,homebloc: event.homeBloc,size: event.size));
      }
}
