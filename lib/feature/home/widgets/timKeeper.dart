part of 'widgets.dart';

class AddTime extends StatefulWidget {
  const AddTime({
    super.key,
  });

  @override
  State<AddTime> createState() => _AddTimeState();
}

class _AddTimeState extends State<AddTime> {
  late TextEditingController _EnterDatetimeController;

  late TextEditingController _EntertimeController;
  late TextEditingController _ExitTimeController;
  final DateFormat format = DateFormat.jm();
  DateTime _selectedDate = DateTime.now();
  TimeOfDay _selectedTime = TimeOfDay.now();
  TimeOfDay _selectedTime2 = TimeOfDay.now();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _EnterDatetimeController = TextEditingController();
    _EntertimeController = TextEditingController();
    _ExitTimeController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _EnterDatetimeController.dispose();
    _EntertimeController.dispose();
    _ExitTimeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: BlocConsumer<HomeBloc, HomeState>(
            listener: (context, state) {
              if (state is HomeError) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.message),
                  ),
                );
              } else if (state is HomeLoaded) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Time Added'),
                  ),
                );
                Navigator.pop(context);
              }
            },
            builder: (context, state) {
              if (state is HomeError) {
                return ErrorOutput(message: state.message, context: context);
              } else if (state is HomeLoading) {
                return Loading();
              }

              return Column(
                children: [
                  vSizedBox4,
                  TextFormField(
                    controller: _EnterDatetimeController,
                    keyboardType: TextInputType.datetime,
                    onTap: () {
                      showDatePicker(
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime.now(),
                        initialEntryMode: DatePickerEntryMode.calendar,
                        context: context,
                        // initialTime: TimeOfDay.now(),
                      ).then((value) {
                        try {
                          setState(() {
                            // _selectedTime =
                            //     TimeOfDay(hour: value!.hour, minute: value.minute);
                            _selectedDate = value!;
                            debugPrint(
                                'Date======: ${_selectedDate.toString()}');
                            _EnterDatetimeController.text =
                                DateFormat('yyyy-MM-dd')
                                    .format(value)
                                    .toString();
                          });
                          debugPrint(
                              'Date======: ${_EnterDatetimeController.text}');
                        } catch (e) {
                          debugPrint('----------------------Error: $e');
                        }
                      });
                    },
                    decoration: const InputDecoration(
                      hintText: 'Enter Date',
                    ),
                  ),
                  vSizedBox1,
                  TextFormField(
                    controller: _ExitTimeController,
                    keyboardType: TextInputType.datetime,
                    onTap: () {
                      try {
                        showTimePicker(
                          context: context,
                          initialTime: const TimeOfDay(hour: 00, minute: 0),
                          helpText: "Enter The Time You Have Exited",
                        ).then((value) {
                          setState(() {
                            _selectedTime = value!;
                            _ExitTimeController.text = value.toString();
                          });
                          debugPrint('Time: ${_ExitTimeController.text}');
                        });
                      } on Exception catch (e) {
                        debugPrint('Error: $e');
                      }
                    },
                    decoration: const InputDecoration(
                      hintText: 'Enter Enter Time',
                    ),
                  ),
                  vSizedBox1,
                  TextFormField(
                    controller: _EntertimeController,
                    keyboardType: TextInputType.datetime,
                    onTap: () {
                      try {
                        showTimePicker(
                          context: context,
                          initialTime: const TimeOfDay(hour: 00, minute: 0),
                          helpText: "Enter The Time You Have Entered",
                        ).then((value) {
                          setState(() {
                            _selectedTime2 = value!;
                            _EntertimeController.text = value.toString();
                          });
                          debugPrint('Time: ${_EntertimeController.text}');
                        });
                      } on Exception catch (e) {
                        debugPrint('Error: $e');
                      }
                    },
                    decoration: const InputDecoration(
                      hintText: 'Enter Exit Time',
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Cancel'),
                  ),
                  TextButton(
                    onPressed: () {
                      // Add time to the database
                      (context).read<HomeBloc>().add(HomePunchIn(
                          punchIn: _selectedTime2,
                          punchOut: _selectedTime,
                          date: _selectedDate,
                          time: const Duration()));

                      // Navigator.pop(context);
                    },
                    child: const Text('Add'),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

addTime({required BuildContext context}) async {
  await showDialog(
    context: context,
    builder: (context) {
      return const AddTime();
    },
  );
}
