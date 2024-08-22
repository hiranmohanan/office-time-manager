import 'package:flutter/material.dart';
import 'package:flutter_office_time/constants/sizer/sizer_data.dart';
import 'package:flutter_office_time/sql%20service/sql_service.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

import '../widgets/widgets.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final DatabaseService _databaseService = DatabaseService.instance;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(10),
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        children: [
          vSizedBox1,
          FutureBuilder(
              future: _databaseService.getPunch(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return const Text('Error');
                } else if (snapshot.hasData && snapshot.data!.isEmpty) {
                  return const Text('No Data');
                }
// calculate the time difference

                final List<Map<String, dynamic>> punchData = snapshot.data!;
                int totalHours = 0;
                DateFormat format = DateFormat.jm();
                try {
                  for (int i = 0; i < punchData.length; i++) {
                    debugPrint(
                        'Punch In: ${punchData[i]['punch_in']}\n Punch Out: ${punchData[i]['punch_out']}');

                    final DateTime punchIn =
                        format.parse(punchData[i]['punch_in']);
                    final DateTime punchOut =
                        format.parse(punchData[i]['punch_out']);
                    final int difference = punchOut.difference(punchIn).inHours;
                    totalHours += difference;
                  }
                } catch (e) {
                  debugPrint('Error: $e');
                }
                return GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2),
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return Card(
                        margin: const EdgeInsets.all(10),
                        color: Colors.blue,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('Total Hours'),
                            Text('$totalHours h'),
                          ],
                        ),
                      );
                    });
              }),
          vSizedBox1,
          const Text('Punch In/Out'),
          vSizedBox1,
          SizedBox(
            width: 90.w,
            height: vBox3,
            child: ElevatedButton(
              onPressed: () {},
              child: Text(
                'Punch In',
                style: Theme.of(context).textTheme.labelLarge,
              ),
            ),
          ),
          vSizedBox1,
          SizedBox(
            width: 90.w,
            height: vBox3,
            child: ElevatedButton(
              onPressed: () {},
              child: Text(
                'Punch Out',
                style: Theme.of(context).textTheme.labelLarge,
              ),
            ),
          ),
          vSizedBox1,
          FutureBuilder(
              future: _databaseService.getPunch(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return const Text('Error');
                } else if (snapshot.hasData && snapshot.data!.isEmpty) {
                  return const Text('No Data');
                }
                return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return Card(
                      margin: const EdgeInsets.all(10),
                      color: Colors.blue,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Date: ${snapshot.data![index]['date']}'),
                          Text(
                              'Punch In: ${snapshot.data![index]['punch_in']}'),
                          Text(
                              'Punch Out: ${snapshot.data![index]['punch_out']}'),
                        ],
                      ),
                    );
                  },
                );
              }),
          MaterialButton(
            onPressed: () {
              _databaseService.getPunch();
            },
            child: const Text('Get punch'),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        // onPressed: () => addTime(context: context),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddTime()));
        },
        tooltip: 'Add Time',
        child: const Icon(Icons.add),
      ),
    );
  }
}
