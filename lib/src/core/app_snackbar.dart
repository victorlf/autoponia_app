import 'package:flutter/material.dart';

enum SnackBarType { success, error, none }
SnackBar getAppSnackBar({
  VoidCallback? onClose,
  SnackBarType type = SnackBarType.none,
  required String message,
}) {
  final Color color;
  if (type == SnackBarType.error) {
    color = Colors.red.shade300;
  } else if (type == SnackBarType.success) {
    color = Colors.green;
  } else {
    color = Colors.grey.shade600;
  }

  return SnackBar(
    content: Text(message),
    duration: const Duration(seconds: 4),
    backgroundColor: color,
    action: SnackBarAction(
      label: 'OK',
      textColor: Colors.black,
      onPressed: () => onClose,
    ),
  );
}
