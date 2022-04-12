import 'package:autoponia_app/src/modules/plant/cubits/plant_state.dart';
import 'package:autoponia_app/src/modules/plant/cubits/plant_cubit.dart';
import 'package:autoponia_app/src/modules/plant/views/widgets/plant_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class PlantsPage extends StatefulWidget {
  const PlantsPage({Key? key}) : super(key: key);

  @override
  State<PlantsPage> createState() => _PlantsPageState();
}

class _PlantsPageState extends ModularState<PlantsPage, PlantCubit> {
  @override
  void initState() {
    super.initState();
    bloc.fetchAll();
    Modular.to.addListener(() {
      if (Modular.to.path == '/plants/') bloc.fetchAll();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('Listagem de Plantas'),
        actions: [
          IconButton(
            onPressed: () => Modular.to.navigate('/home'),
            icon: const Icon(Icons.home),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: BlocBuilder<PlantCubit, PlantState>(
            bloc: bloc,
            builder: (_, state) {
              if (state is LoadingPlantState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              if (state is NoDataPlantState) {
                return Center(
                  child: Text(
                    state.message,
                    style: TextStyle(fontSize: 18.0),
                  ),
                );
              }

              if (state is ErrorPlantState) {
                return Center(
                  child: Text(
                    state.message,
                    style: TextStyle(fontSize: 18.0),
                  ),
                );
              }

              if (state is SuccessPlantState) {
                return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 20.0,
                    crossAxisSpacing: 20.0,
                  ),
                  itemCount: state.plants.length,
                  itemBuilder: (context, index) {
                    return PlantCard(state.plants[index]);
                  },
                );
              }

              return const SizedBox();
            }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Modular.to.pushNamed('./plant_edit'),
        child: const Icon(Icons.add),
        backgroundColor: Colors.green,
      ),
    );
  }
}
