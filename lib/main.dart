import 'package:autoponia_app/src/modules/app/app_module.dart';
import 'package:autoponia_app/src/modules/app/app_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

void main() {
  Modular.to.addListener(() {
    print(Modular.to.path);
  });

  runApp(
    ModularApp(
      module: AppModule(),
      child: const AppWidget(),
    ),
  );
}
