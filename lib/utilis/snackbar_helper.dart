import 'package:flutter/material.dart';

Future<void> showErrorMessage(
  BuildContext context, {
  required String message,
}) async {
  final snackBar = SnackBar(
    content: Text(
      message,
      style: const TextStyle(color: Colors.white),
    ),
    backgroundColor: Colors.red,
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

Future<void> showDeleteMessage(
  BuildContext context, {
  required String message,
}) async {
  final snackBar = SnackBar(content: Text(message));
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

Future<void> showSuccessMessage(
  context, {
  required String message,
}) async {
  final snackBar = SnackBar(content: Text(message));
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
