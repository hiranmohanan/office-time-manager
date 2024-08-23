import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../../sql service/sql_service.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomePunchIn>(_init);
    on<HomePunchGet>(_getPunch);
  }
  Future<void> _init(
    HomePunchIn event,
    Emitter<HomeState> emit,
  ) async {
    emit(HomeLoading());
    try {
      final DatabaseService _databaseService = DatabaseService.instance;
      DateTime now = event.date;
      DateTime startDateTime = DateTime(now.year, now.month, now.day,
          event.punchIn.hour, event.punchIn.minute);
      DateTime endDateTime = DateTime(now.year, now.month, now.day,
          event.punchOut.hour, event.punchOut.minute);
      Duration difference = endDateTime.difference(startDateTime);
      int hours = difference.inHours;
      int minutes = difference.inMinutes.remainder(60);
      DateFormat format = DateFormat.jm();
      DateFormat dateFormat = DateFormat('yyyy-MM-dd');

      _databaseService.addPunch(
        date: dateFormat.format(event.date),
        time: '$hours:$minutes',
        punchIn: format.format(startDateTime).toString(),
        punchOut: format.format(endDateTime).toString(),
      );
      debugPrint('Punch In: ${event.punchIn} Punch Out: ${event.punchOut}');
      emit(HomeLoaded());
    } catch (e) {
      debugPrint('Error in bloc: $e');
      emit(HomeError(e.toString()));
    }
  }

  Future<void> _getPunch(
    HomePunchGet event,
    Emitter<HomeState> emit,
  ) async {
    emit(HomeLoading());
    try {
      final DatabaseService _databaseService = DatabaseService.instance;
      final List<Map<String, dynamic>> punch =
          await _databaseService.getPunch();

      emit(HomePunch(punch));
    } on Exception catch (e) {
      emit(HomeError(e.toString()));
    }
  }
}
