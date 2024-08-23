part of 'widgets.dart';

Widget ErrorOutput({required String message, required BuildContext context}) {
  return Column(
    children: [
      Text(message),
      TextButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: const Text('Cancel'),
      ),
    ],
  );
}
