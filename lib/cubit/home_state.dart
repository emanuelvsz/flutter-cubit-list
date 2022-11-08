part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitialState extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeLoadedListState extends HomeState {
  List<Set<HomeItem>> homes;

  HomeLoadedListState(this.homes);
}

class HomeErrorState extends HomeState {
  String message;

  HomeErrorState(this.message);
}


