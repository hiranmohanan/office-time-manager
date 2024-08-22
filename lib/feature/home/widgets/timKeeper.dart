part of 'widgets.dart';

class AddTime extends StatelessWidget {
  const AddTime({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final TextEditingController _EnterDatetimeController =
        TextEditingController();
    final TextEditingController _EntertimeController = TextEditingController();
    final TextEditingController _ExitTimeController = TextEditingController();
    final DateFormat format = DateFormat.jm();
    DateTime _selectedDate = DateTime.now();
    final DatabaseService _databaseService = DatabaseService.instance;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              vSizedBox4,
              TextFormField(
                controller: _EnterDatetimeController,
                keyboardType: TextInputType.datetime,
                onTap: () {
                  showDatePicker(
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2025),
                    context: context,
                    // initialTime: TimeOfDay.now(),
                  ).then((value) {
                    try {
                      debugPrint('Date: $value');

                      _selectedDate = value!;
                      _EnterDatetimeController.text =
                          format.parse(value.toString()).toString();
                      debugPrint('Date======: $_selectedDate');
                    } catch (e) {
                      debugPrint('Error: $e');
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
                  timePickerrr(context).then((value) {
                    _ExitTimeController.text = format
                        .parse(DateTime(
                          _selectedDate.year,
                          _selectedDate.month,
                          _selectedDate.day,
                          value!.hour,
                          value.minute,
                        ).toString())
                        .toString();
                    debugPrint('Timeexit: ${_ExitTimeController.text}');
                  });
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
                  timePickerrr(context).then((value) {
                    _EntertimeController.text = format
                        .parse(DateTime(
                          _selectedDate.year,
                          _selectedDate.month,
                          _selectedDate.day,
                          value!.hour,
                          value.minute,
                        ).toString())
                        .toString();
                    debugPrint('Timeexit: ${_ExitTimeController.text}');
                  });
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
                  _databaseService.addPunch(
                    date: _selectedDate.toString(),
                    time: _selectedDate.toString(),
                    punchIn: _EntertimeController.text,
                    punchOut: _ExitTimeController.text,
                  );
                  Navigator.pop(context);
                },
                child: const Text('Add'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<TimeOfDay?> timePickerrr(BuildContext context) {
    return showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
  }
}

addTime({required BuildContext context}) async {
  await showDialog(
    context: context,
    builder: (context) {
      return AddTime();
    },
  );
}
