import 'package:autoponia_app/src/modules/plant/services/plant_service.dart';
import 'package:autoponia_app/src/modules/plant/cubits/plant_cubit.dart';
import 'package:autoponia_app/src/modules/plant/views/pages/plant_edit.dart';
import 'package:autoponia_app/src/modules/plant/views/pages/plant_page.dart';
import 'package:autoponia_app/src/modules/plant/views/pages/plants_page.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

class PlantModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.lazySingleton((i) => Dio()),
        Bind.lazySingleton((i) => PlantService(i())),
        Bind.lazySingleton((i) => PlantCubit(i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, __) => const PlantsPage()),
        ChildRoute('/plant', child: (_, args) => PlantPage(args.data)),
        ChildRoute('/plant_edit',
            child: (_, args) => PlantEdit(plant: args.data)),
      ];
}
