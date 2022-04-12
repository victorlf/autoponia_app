import 'package:autoponia_app/src/core/app_alertdialog.dart';
import 'package:autoponia_app/src/core/app_snackbar.dart';
import 'package:autoponia_app/src/modules/plant/models/plant_model.dart';
import 'package:autoponia_app/src/modules/plant/cubits/plant_state.dart';
import 'package:autoponia_app/src/modules/plant/cubits/plant_cubit.dart';
import 'package:autoponia_app/src/modules/plant/views/widgets/plant_info_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class PlantPage extends StatefulWidget {
  final PlantModel plant;
  const PlantPage(
    this.plant, {
    Key? key,
  }) : super(key: key);

  @override
  State<PlantPage> createState() => _PlantPageState();
}

class _PlantPageState extends ModularState<PlantPage, PlantCubit> {
  onDelete() {
    bloc.delete(widget.plant).then((_) {
      ScaffoldMessenger.of(context).showSnackBar(
        getAppSnackBar(
          message: 'Planta deletada com sucesso',
          type: SnackBarType.success,
        ),
      );
      Modular.to.pop();
    }).catchError((_) {
      ScaffoldMessenger.of(context).showSnackBar(
        getAppSnackBar(
          message: 'Erro ao tentar deletar planta',
          type: SnackBarType.error,
        ),
      );
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('Informações da Planta'),
        actions: [
          IconButton(
            onPressed: () => showDialog<void>(
              context: context,
              barrierDismissible: false,
              builder: (BuildContext context) {
                return AppAlertDialog(
                  message: 'Tem certeza que deseja deletar a planta?',
                  action: onDelete,
                );
              },
            ),
            icon: BlocBuilder(
                bloc: bloc,
                builder: (context, state) {
                  if (state is LoadingPlantState) return SizedBox();
                  return const Icon(
                    Icons.delete_outline,
                    color: Colors.red,
                  );
                }),
          )
        ],
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
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  ListTile(
                    tileColor: Colors.teal,
                    title: const Text('Configurado'),
                    trailing: IconButton(
                        onPressed: () => Modular.to
                            .pushNamed('./plant_edit', arguments: widget.plant),
                        icon: const Icon(
                          Icons.edit,
                          color: Colors.white,
                        )),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  PlantInfoTile(title: 'Nome', content: widget.plant.name),
                  PlantInfoTile(
                      title: 'Regador', content: widget.plant.watering),
                  PlantInfoTile(
                    title: 'Dosagem',
                    content: '${widget.plant.dosage} m³/min',
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  const ListTile(
                    tileColor: Colors.blue,
                    title: Text('Monitoramento'),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  PlantInfoTile(
                    title: 'Umidade',
                    content: '${widget.plant.humidity} %',
                  ),
                  PlantInfoTile(
                    title: 'Temperatura',
                    content: '${widget.plant.temperature} ºC',
                  ),
                ],
              ),
            );
          }),
    );
  }
}
