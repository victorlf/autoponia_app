import 'package:autoponia_app/src/modules/app/views/pages/home_page.dart';
import 'package:autoponia_app/src/modules/app/views/pages/splash_page.dart';
import 'package:autoponia_app/src/modules/plant/plant_module.dart';
import 'package:autoponia_app/src/modules/sprinker/sprinker_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  List<Bind<Object>> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const SplashPage()),
        ChildRoute('/home', child: (context, args) => const HomePage()),
        ModuleRoute('/plants', module: PlantModule()),
        ModuleRoute('/sprinkler', module: SprinklerModule()),
      ];
}
