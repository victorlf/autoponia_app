import 'package:autoponia_app/src/modules/sprinker/cubits/sprinkler_cubit.dart';
import 'package:autoponia_app/src/modules/sprinker/services/sprinkler_service.dart';
import 'package:autoponia_app/src/modules/sprinker/views/pages/sprinker_page.dart';
import 'package:autoponia_app/src/modules/sprinker/views/pages/sprinkler_edit.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SprinklerModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.lazySingleton((i) => Dio()),
        Bind.lazySingleton((i) => SprinklerService(i())),
        Bind.lazySingleton((i) => SprinklerCubit(i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, __) => const SprinklerPage()),
        // ChildRoute('/plant', child: (_, args) => PlantPage(args.data)),
        ChildRoute('/plant_edit',
            child: (_, args) => SprinklerEdit(sprinkler: args.data)),
      ];
}
