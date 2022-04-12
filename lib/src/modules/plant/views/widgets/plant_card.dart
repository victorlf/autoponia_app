import 'package:autoponia_app/src/modules/plant/models/plant_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class PlantCard extends StatelessWidget {
  final PlantModel plant;
  const PlantCard(
    this.plant, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Modular.to.pushNamed('./plant', arguments: plant),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Colors.green.shade500,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
              ),
              alignment: Alignment.center,
              child: Text(
                plant.name,
                style: const TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        const Text(
                          'Regador: ',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(plant.watering),
                      ],
                    ),
                    Row(
                      children: [
                        const Text(
                          'Umid (%): ',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text('${plant.humidity}'),
                      ],
                    ),
                    Row(
                      children: [
                        const Text(
                          'Temp (ºC): ',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text('${plant.temperature}'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
