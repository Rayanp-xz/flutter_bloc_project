import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_project/BlocIcon/GroceryProduts/grocery_class.dart';
import 'package:meta/meta.dart';

import 'GroceryProduts/grocery_list.dart';
import 'Screens/Products/Items/cart_items.dart';
import 'Screens/Products/Items/wishlist_items.dart';

part 'bloc_icon_event.dart';
part 'bloc_icon_state.dart';

class IconBloc extends Bloc<IconEvent, IconState> {
  IconBloc() : super(IconInitial()) {
    on<HomeInitialEvent>(homeInitialEvent);
    on<WishlistClickedEvent>(wishlistClickedEvent);
    on<CartClickedEvent>(cartClickedEvent);
    on<WishlistNavigateEvent>(wishlistNavigateEvent);
    on<CartNavigateEvent>(cartNavigateEvent);

  }


  FutureOr<void> homeInitialEvent(HomeInitialEvent event, Emitter<IconState> emit) async{
    emit(HomeLoadingState());
    await Future.delayed(Duration(seconds: 3));
    emit(HomeLoadSuccessState(products: Grocery.groceryList.map((e)=>ProductDataMadel(

        price: e['price'],
        name: e['name'],
        quantity: e['quantity'],
        image: e['image'])).toList()
    ));

  }
  FutureOr<void> wishlistClickedEvent(WishlistClickedEvent event, Emitter<IconState> emit) {

    print(" Wishlist clicked");
    WishlistItems.add(event.clickedProduct);
    emit(HomeProductItemWishlistedActionState());
  }

  FutureOr<void> cartClickedEvent(CartClickedEvent event, Emitter<IconState> emit) {
    print(" Cart clicked");
    cartItem.add(event.clickedProduct);
    emit(HomeProductItemCartedActionState());
  }

  FutureOr<void> wishlistNavigateEvent(WishlistNavigateEvent event, Emitter<IconState> emit) {
    print(" Wishlist Navigated");
    emit(NavigateToVWishlistActionState());
  }

  FutureOr<void> cartNavigateEvent(CartNavigateEvent event, Emitter<IconState> emit) {
    print("Cart navigated");
    emit(NavigateToCartActionState());
  }



}
