import 'package:flutter/material.dart';

import '../../GroceryProduts/grocery_class.dart';
import '../../bloc_icon_bloc.dart';

class GroceryProductsPage extends StatelessWidget {
  const GroceryProductsPage({super.key,required this.productDataModel, required this.homeBloc});
  final ProductDataMadel productDataModel;
  final IconBloc homeBloc;

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
                      homeBloc.add(WishlistClickedEvent(
                          clickedProduct:productDataModel
                      ));
                      // homeBloc.add(WishlistNavigateEvent());
                    }, icon: Icon(Icons.favorite)),
                IconButton(
                    onPressed: () {
                      homeBloc.add(CartClickedEvent(
                          clickedProduct:productDataModel
                      ));
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
