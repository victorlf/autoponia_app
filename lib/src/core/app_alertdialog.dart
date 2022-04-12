import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppAlertDialog extends StatelessWidget {
  final String message;
  final Function action;
  const AppAlertDialog({Key? key, required this.message, required this.action})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(message),
      actions: <Widget>[
        TextButton(
          child: const Text(
            'Cancelar',
            style: TextStyle(color: Colors.red),
          ),
          onPressed: () {
            Modular.to.pop(context);
          },
        ),
        TextButton(
          child: const Text('Deletar'),
          onPressed: () {
            action();
            Modular.to.pop(context);
          },
        ),
      ],
    );
  }
}
