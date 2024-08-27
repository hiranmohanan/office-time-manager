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

class Punchclicking extends HomeState {
  final Duration time;
  Punchclicking(this.time);
}

class PunchClicked extends HomeState {
  final Duration time;
  PunchClicked(this.time);
}
