part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {}

class HomeError extends HomeState {
  final String message;
  HomeError(this.message);
}

class HomePunch extends HomeState {
  final List<Map<String, dynamic>> punch;
  HomePunch(this.punch);
}
