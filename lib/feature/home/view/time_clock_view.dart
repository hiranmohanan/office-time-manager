import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/bloc/home_bloc.dart';

class ClockScreen extends StatefulWidget {
  const ClockScreen({super.key});

  @override
  _ClockScreenState createState() => _ClockScreenState();
}

class _ClockScreenState extends State<ClockScreen> {
  late DateTime currentTime;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    // Set the starting time here
    currentTime = DateTime(0); // Year, Month, Day, Hour, Minute, Second
    // _startClock();
  }

  void _startClock() {
    timer = Timer.periodic(const Duration(seconds: 1), (Timer t) {
      setState(() {
        currentTime = currentTime.add(const Duration(seconds: 1));
      });
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {
          if (state is Punchclicking) {
            _startClock();
          }
          if (state is PunchClicked) {
            timer?.cancel();
          }
        },
        builder: (context, state) {
          if (state is Punchclicking) {
            return Text(
              '${currentTime.hour.toString().padLeft(2, '0')}:'
              '${currentTime.minute.toString().padLeft(2, '0')}:'
              '${currentTime.second.toString().padLeft(2, '0')}',
              style: const TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            );
          }
          if (state is PunchClicked) {
            return Text(
              '${currentTime.hour.toString().padLeft(2, '0')}:'
              '${currentTime.minute.toString().padLeft(2, '0')}:'
              '${currentTime.second.toString().padLeft(2, '0')}',
              style: const TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            );
          }

          return const SizedBox();
        },
      ),
    );
  }
}
