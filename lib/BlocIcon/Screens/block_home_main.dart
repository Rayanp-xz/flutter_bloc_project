import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_project/BlocIcon/bloc_icon_bloc.dart';

import 'Products/grocery_products_page.dart';
import 'bloc_wishlist.dart';
import 'Carts/UI/cart_page.dart';

class CartIconHome extends StatefulWidget {
  const CartIconHome({super.key});

  @override
  State<CartIconHome> createState() => _CartIconHomeState();
}
IconBloc homeBloc =IconBloc();
int num=0;
class _CartIconHomeState extends State<CartIconHome> {
  @override
  void initState() {
    homeBloc.add(HomeInitialEvent());
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<IconBloc, IconState>(
      bloc: homeBloc,
      listenWhen: (previous,current)=>current is HomeActionState,
      buildWhen:(previous,current)=>current is !HomeActionState ,
      listener: (context, state) {
       if(state is NavigateToCartActionState){
         Navigator.of(context).push(MaterialPageRoute(builder: (_){
           return BlocCart();
         }));
       }
      else if(state is NavigateToVWishlistActionState){
         Navigator.of(context).push(MaterialPageRoute(builder: (_){
           return BlocWishlist();
         }));
       }
      else if(state is HomeProductItemCartedActionState){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Item carted")));
        setState(() {
          num++;
        });
       }
       else if(state is HomeProductItemWishlistedActionState){
         ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Item whishlisted")));
       }
      },
      builder: (context, state) {
       switch (state.runtimeType){
         case HomeLoadingState:
         return Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
        );
         case HomeLoadSuccessState:
           final successState =state as HomeLoadSuccessState;
           return Scaffold(
             appBar: AppBar(
               actions: [
                 IconButton(
                     onPressed: () {
                       homeBloc.add(WishlistNavigateEvent());
                     }, icon: Icon(Icons.favorite)),
                 Container(
                   child: Stack(
                     children: [
                       IconButton(
                           onPressed: () {
                             homeBloc.add(CartNavigateEvent());
                           }, icon: Icon(Icons.shopping_cart)),
                       Padding(
                         padding: const EdgeInsets.only(left: 17,bottom: 5),
                         child: CircleAvatar(
                           backgroundColor: Colors.redAccent,
                           radius: 7,
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 2),
                            child: Text("${num}",style: TextStyle(fontSize: 11),),
                          ),
                         ),
                       )
                     ],
                   ),
                 ),

               ],
             ),
             body: ListView.builder(
               itemCount: successState.products.length,
                 itemBuilder: (context,index){
               return GroceryProductsPage(productDataModel: successState.products[index], homeBloc:homeBloc,);
             })

           );
         case HomeErrorState:
           return Scaffold(
             body: Center(
               child: Text("k"),
             ),
           );
         default:
           return Scaffold(
             body: SizedBox(),
           );
       }
      },
    );
  }
}

