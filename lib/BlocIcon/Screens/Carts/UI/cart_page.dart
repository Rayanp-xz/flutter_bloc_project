import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_project/BlocIcon/Screens/Carts/cart_bloc.dart';
import 'package:flutter_bloc_project/BlocIcon/Screens/block_home_main.dart';

import '../../Products/grocery_products_page.dart';
import 'grocery_cart_page.dart';

class BlocCart extends StatefulWidget {
  const BlocCart({super.key});

  @override
  State<BlocCart> createState() => _BlocCartState();
}

class _BlocCartState extends State<BlocCart> {
  final CartBloc cartBloc = CartBloc();
  @override
  void initState() {
    cartBloc.add(CartInitialEvent());
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart Items"),

      ),
      body: BlocConsumer<CartBloc,CartState>(
        bloc: cartBloc,
        listener: (BuildContext context, CartState state) {  },
        listenWhen: (previous,current)=> current is CartActionState,
        buildWhen: (previous,current)=> current is !CartActionState,
        builder: (BuildContext context, CartState state) {
         switch (state.runtimeType){
           case CartSuccessState:
             final successState= state as CartSuccessState;
             return ListView.builder(
               itemCount: successState.cartItems.length,
                 itemBuilder: (context,index){
                 return GroceryCartPage(
                   cartBloc:cartBloc,
                   productDataModel: successState.cartItems[index],
                 );

             });
           default:

         }
         return Container();

        },

      ),
    );
  }
}
