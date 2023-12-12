part of 'bloc_icon_bloc.dart';

@immutable
abstract class IconState {}

abstract class HomeActionState extends IconState{}

class IconInitial extends IconState {}

class HomeLoadingState extends IconState {}


class HomeLoadSuccessState extends IconState{
  final List<ProductDataMadel> products;

  HomeLoadSuccessState({required this.products});
}


class HomeErrorState extends IconState{}


class NavigateToVWishlistActionState extends HomeActionState{}

class NavigateToCartActionState extends HomeActionState{}


class HomeProductItemWishlistedActionState extends HomeActionState{}
class HomeProductItemCartedActionState extends HomeActionState{}


