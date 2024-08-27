part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class HomegetPunch extends HomeEvent {
  final DateTime date;
  HomegetPunch(this.date);
}

class HomePunchIn extends HomeEvent {
  final TimeOfDay punchIn;
  final TimeOfDay punchOut;
  final DateTime date;
  final Duration time;
  HomePunchIn(
      {required this.punchIn,
      required this.punchOut,
      required this.date,
      required this.time});
}

class HomePunchGet extends HomeEvent {
  HomePunchGet();
}

class HomePunchClickStart extends HomeEvent {
  final DateTime time;
  HomePunchClickStart(
    this.time,
  );
}

class HomePunchClickEnd extends HomeEvent {
  final DateTime time;
  HomePunchClickEnd(
    this.time,
  );
}
