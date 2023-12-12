import 'package:flutter/material.dart';

import '../../../GroceryProduts/grocery_class.dart';
import '../cart_bloc.dart';



class GroceryCartPage extends StatelessWidget {
  const GroceryCartPage({super.key,required this.productDataModel,  required this.cartBloc});
  final ProductDataMadel productDataModel;
  final CartBloc cartBloc;

  @override
  Widget build(BuildContext context) {
    return  Card(
      child: SizedBox(

        child: Column(
          children: [
            Image.network("${productDataModel.image}",fit: BoxFit.cover,),
            Text("${productDataModel.name}"),
            Text("MRP: ${productDataModel.price}"),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                    onPressed: () {
                      // cartBloc.add(WishlistClickedEvent(
                      //     clickedProduct:productDataModel
                      // ));
                      // homeBloc.add(WishlistNavigateEvent());
                    }, icon: Icon(Icons.favorite)),
                IconButton(
                    onPressed: () {
                      // cartBloc.add(CartClickedEvent(
                      //     clickedProduct:productDataModel
                      // ));
                      // homeBloc.add(CartNavigateEvent());
                    }, icon: Icon(Icons.shopping_cart)),
              ],
            ),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );

  }
}
