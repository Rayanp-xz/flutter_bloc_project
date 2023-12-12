import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_project/BlocIcon/Screens/Products/Items/cart_items.dart';
import 'package:meta/meta.dart';

import '../../GroceryProduts/grocery_class.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<CartInitialEvent>(cartInitialEvent);
  }

  FutureOr<void> cartInitialEvent(CartInitialEvent event, Emitter<CartState> emit) {
    emit(CartSuccessState(
      cartItems: cartItem
    ));
  }
}
