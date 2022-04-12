import 'package:autoponia_app/src/modules/plants/models/plant_model.dart';
import 'package:autoponia_app/src/modules/plants/store/plant_store.dart';
import 'package:flutter_test/flutter_test.dart';

void main() async {
  final store = PlantStore();

  await store.fetchAll();

  // final plant = store.plants[0].copyWith(name: 'Samambaia update');
  // await store.update(plant);

  // await store.delete(store.plants[1]);

  final plant = PlantModel(
    name: 'Suculentas',
    watering: '3',
    dosage: 6,
    humidity: 30,
    temperature: 25,
  );

  await store.create(plant);

  print(store.plants[0].name);
}
