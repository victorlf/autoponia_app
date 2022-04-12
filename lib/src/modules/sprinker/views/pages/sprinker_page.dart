import 'package:autoponia_app/src/core/app_alertdialog.dart';
import 'package:autoponia_app/src/core/app_snackbar.dart';
import 'package:autoponia_app/src/modules/plant/views/widgets/plant_info_tile.dart';
import 'package:autoponia_app/src/modules/sprinker/cubits/sprinkler_cubit.dart';
import 'package:autoponia_app/src/modules/sprinker/cubits/sprinkler_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SprinklerPage extends StatefulWidget {
  const SprinklerPage({
    Key? key,
  }) : super(key: key);

  @override
  State<SprinklerPage> createState() => _SprinklerPageState();
}

class _SprinklerPageState extends ModularState<SprinklerPage, SprinklerCubit> {
  onDelete() {
    bloc.delete(bloc.sprinklers[0]).then((_) {
      ScaffoldMessenger.of(context).showSnackBar(
        getAppSnackBar(
          message: 'Irrigador deletado com sucesso',
          type: SnackBarType.success,
        ),
      );
      bloc.fetchAll();
    }).catchError((_) {
      ScaffoldMessenger.of(context).showSnackBar(
        getAppSnackBar(
          message: 'Erro ao tentar deletar irrigador',
          type: SnackBarType.error,
        ),
      );
    });
  }

  @override
  void initState() {
    super.initState();
    bloc.fetchAll();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Informações do Irrigador'),
        actions: [
          IconButton(
            onPressed: () => showDialog<void>(
              context: context,
              barrierDismissible: false,
              builder: (BuildContext context) {
                return AppAlertDialog(
                  message: 'Tem certeza que deseja deletar o irrigador?',
                  action: onDelete,
                );
              },
            ),
            icon: BlocBuilder(
                bloc: bloc,
                builder: (context, state) {
                  if (state is LoadingSprinklerState &&
                      state is NoDataSprinklerState) return const SizedBox();
                  return const Icon(
                    Icons.delete_outline,
                    color: Colors.red,
                  );
                }),
          ),
          IconButton(
            onPressed: () => Modular.to.navigate('/home'),
            icon: const Icon(Icons.home),
          ),
        ],
      ),
      body: BlocBuilder(
        bloc: bloc,
        builder: (context, state) {
          if (state is LoadingSprinklerState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is NoDataSprinklerState) {
            return Center(
              child: Text(
                state.message,
                style: TextStyle(fontSize: 18.0),
              ),
            );
          }

          if (state is SuccessSprinklerState) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  ListTile(
                    tileColor: Colors.teal,
                    title: const Text('Configurado'),
                    trailing: IconButton(
                        onPressed: () => Modular.to.pushNamed('./plant_edit',
                            arguments: state.sprinkler[0]),
                        icon: const Icon(
                          Icons.edit,
                          color: Colors.white,
                        )),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  PlantInfoTile(
                      title: 'Nome', content: state.sprinkler[0].name),
                  PlantInfoTile(
                      title: 'Duração',
                      content: state.sprinkler[0].duration.toString()),
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
                    title: 'Data da última Medida',
                    content: state.sprinkler[0].lastDosage,
                  ),
                  PlantInfoTile(
                    title: 'Fonte de Água',
                    content: state.sprinkler[0].isSourceOk
                        ? 'Conectada'
                        : 'Desconectada',
                  ),
                ],
              ),
            );
          }

          return const SizedBox();
        },
      ),
      floatingActionButton: BlocBuilder(
          bloc: bloc,
          builder: (context, state) {
            if (state is NoDataSprinklerState) {
              return FloatingActionButton(
                  onPressed: () => Modular.to.pushNamed('./plant_edit'),
                  child: const Icon(Icons.add));
            }

            return const SizedBox();
          }),
    );
  }
}
