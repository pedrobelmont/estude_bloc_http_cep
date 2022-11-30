import 'package:buscar_cep/scraan/Tela_erro.dart';
import 'package:buscar_cep/scraan/Tree/Tree.dart';
import 'package:buscar_cep/scraan/bloc/bloc_ctrl.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(MultiProvider(
    providers: [],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ApiCubit(),
      child: const BlocHomePage(),
    );
  }
}

class BlocHomePage extends StatelessWidget {
  const BlocHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: InicialPage());
  }
}

class InicialPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('busca pelo cep')),
      body: BlocBuilder<ApiCubit, TreeState>(
        builder: (context, state) {
          if (state is CepCarregadoComSucesso) {
            return Center(
              child: Text(state.endercoCarregado.toString()),
            );
          }
          if (state is IniciaState) {
            return Center(
              child: Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                        icon: Icon(Icons.add_location),
                        labelText: 'digite seu cep'),
                    onChanged: ((value) => (value)),
                  ),
                  Padding(
                    padding: EdgeInsets.all(20.0),
                    child: ElevatedButton(
                      child: Icon(Icons.adjust),
                      onPressed: () {
                        context.read<ApiCubit>().add(Buscarpelocep());
                      },
                    ),
                  ),
                ],
              ),
            );
          }
          return const Center(
            child: TelaErro(),
          );
        },
      ),
    );
  }
}
