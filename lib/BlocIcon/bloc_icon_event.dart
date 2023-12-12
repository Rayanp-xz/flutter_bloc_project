part of 'bloc_icon_bloc.dart';

@immutable
abstract class IconEvent {}
class HomeInitialEvent extends IconEvent{}

class WishlistClickedEvent extends IconEvent{
  final ProductDataMadel clickedProduct;

  WishlistClickedEvent({required this.clickedProduct});
}


class CartClickedEvent extends IconEvent{
  final ProductDataMadel clickedProduct;

  CartClickedEvent({required this.clickedProduct});
}


class WishlistNavigateEvent extends IconEvent{}

class CartNavigateEvent extends IconEvent{

}
