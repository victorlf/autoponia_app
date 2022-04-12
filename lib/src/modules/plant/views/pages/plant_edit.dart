import 'package:autoponia_app/src/core/app_snackbar.dart';
import 'package:autoponia_app/src/modules/plant/models/plant_model.dart';
import 'package:autoponia_app/src/modules/plant/cubits/plant_state.dart';
import 'package:autoponia_app/src/modules/plant/cubits/plant_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class PlantEdit extends StatefulWidget {
  final PlantModel? plant;
  const PlantEdit({this.plant, Key? key}) : super(key: key);

  @override
  State<PlantEdit> createState() => _PlantEditState();
}

class _PlantEditState extends ModularState<PlantEdit, PlantCubit> {
  late TextEditingController nameController;
  late TextEditingController dosageController;

  void onSave() {
    bloc
        .update(widget.plant!.copyWith(
      name: nameController.text,
      dosage: int.parse(dosageController.text),
    ))
        .then((_) {
      ScaffoldMessenger.of(context).showSnackBar(
        getAppSnackBar(
          message: 'Planta atualizada com sucesso',
          type: SnackBarType.success,
        ),
      );
      Modular.to.navigate('/plants');
    }).catchError((_) {
      ScaffoldMessenger.of(context).showSnackBar(
        getAppSnackBar(
          message: 'Erro ao atualizar planta',
          type: SnackBarType.error,
        ),
      );
    });
  }

  void onCreate() {
    final plant = PlantModel(
        name: nameController.text,
        watering: bloc.plants.length.toString(),
        dosage: int.parse(dosageController.text),
        humidity: 30,
        temperature: 25);

    bloc.create(plant).then((_) {
      ScaffoldMessenger.of(context).showSnackBar(
        getAppSnackBar(
          message: 'Planta criada com sucesso',
          type: SnackBarType.success,
        ),
      );
      Modular.to.navigate('/plants');
    }).catchError((_) {
      ScaffoldMessenger.of(context).showSnackBar(
        getAppSnackBar(
          message: 'Erro ao criar planta',
          type: SnackBarType.error,
        ),
      );
    });
  }

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(
        text: widget.plant != null ? widget.plant!.name : '');
    dosageController = TextEditingController(
        text: widget.plant != null ? widget.plant!.dosage.toString() : '');
  }

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    dosageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Editar Planta'),
      ),
      body: BlocBuilder(
          bloc: bloc,
          builder: (context, state) {
            if (state is LoadingPlantState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
              child: Column(
                children: [
                  TextFormField(
                    controller: nameController,
                    decoration: const InputDecoration(
                      labelText: 'Nome *',
                    ),
                    maxLength: 10,
                  ),
                  TextFormField(
                    controller: dosageController,
                    decoration: const InputDecoration(
                      labelText: 'Dosagem (m³/min)*',
                    ),
                    maxLength: 3,
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: Colors.blue),
                      onPressed: () =>
                          widget.plant != null ? onSave() : onCreate(),
                      child: Text('Salvar')),
                ],
              ),
            );
          }),
    );
  }
}
