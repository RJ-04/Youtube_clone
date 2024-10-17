import 'package:flutter/widgets.dart';

class ErrorPage extends StatelessWidget {
  final String? error;
  const ErrorPage({this.error, super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        error ?? 'Something went wrong please try again later',
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }
}
