import 'package:flutter/material.dart';

// Future<TimeOfDay> timer() async {
//   return showTimePicker(
//     context: context,
//     initialTime: TimeOfDay.now(),
//   );
// }

Stream<Duration> timerStream({required DateTime time}) async* {
  yield* Stream.periodic(Duration(seconds: 1), (int a) {
    Duration t = DateTime.now().difference(time);

    return Duration(
        seconds: t.inSeconds, minutes: t.inMinutes, hours: t.inHours);
  });
}
