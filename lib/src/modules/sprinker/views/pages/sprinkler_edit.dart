import 'package:autoponia_app/src/core/app_snackbar.dart';
import 'package:autoponia_app/src/core/widgets/input_form.dart';
import 'package:autoponia_app/src/modules/plant/cubits/plant_state.dart';
import 'package:autoponia_app/src/modules/sprinker/cubits/sprinkler_cubit.dart';
import 'package:autoponia_app/src/modules/sprinker/models/sprinkler_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SprinklerEdit extends StatefulWidget {
  final SprinklerModel? sprinkler;
  const SprinklerEdit({this.sprinkler, Key? key}) : super(key: key);

  @override
  State<SprinklerEdit> createState() => _SprinklerEditState();
}

class _SprinklerEditState extends ModularState<SprinklerEdit, SprinklerCubit> {
  late TextEditingController nameController;
  late TextEditingController durationController;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void onSave() {
    if (_formKey.currentState!.validate()) {
      bloc
          .update(widget.sprinkler!.copyWith(
        name: nameController.text,
        duration: int.parse(durationController.text),
      ))
          .then((_) {
        ScaffoldMessenger.of(context).showSnackBar(
          getAppSnackBar(
            message: 'Irrigador atualizada com sucesso',
            type: SnackBarType.success,
          ),
        );
        Modular.to.pop();
        bloc.fetchAll();
      }).catchError((_) {
        ScaffoldMessenger.of(context).showSnackBar(
          getAppSnackBar(
            message: 'Erro ao atualizar irrigador',
            type: SnackBarType.error,
          ),
        );
      });
    }
  }

  void onCreate() {
    if (_formKey.currentState!.validate()) {
      final plant = SprinklerModel(
          name: nameController.text,
          duration: int.parse(durationController.text),
          lastDosage: '14-03-2022',
          isSourceOk: true);

      bloc.create(plant).then((_) {
        ScaffoldMessenger.of(context).showSnackBar(
          getAppSnackBar(
            message: 'Planta criada com sucesso',
            type: SnackBarType.success,
          ),
        );
        Modular.to.pop();
        bloc.fetchAll();
      }).catchError((_) {
        ScaffoldMessenger.of(context).showSnackBar(
          getAppSnackBar(
            message: 'Erro ao criar planta',
            type: SnackBarType.error,
          ),
        );
      });
    }
  }

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(
        text: widget.sprinkler != null ? widget.sprinkler!.name : '');
    durationController = TextEditingController(
        text: widget.sprinkler != null
            ? widget.sprinkler!.duration.toString()
            : '');
  }

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    durationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Editar Irrigador'),
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
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    InputForm(
                      controller: nameController,
                      label: 'Nome *',
                      maxLength: 10,
                    ),
                    InputForm(
                      controller: durationController,
                      label: 'Duração (min)*',
                      maxLength: 2,
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: Colors.blue),
                      onPressed: () =>
                          widget.sprinkler != null ? onSave() : onCreate(),
                      child: const Text('Salvar'),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
