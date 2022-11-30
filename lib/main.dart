import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // provedor global do tema
    return BlocProvider(
      create: (_) => ThemeCubit(),
      child: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeData>(
      builder: (_, theme) {
        return MaterialApp(
          theme: theme,
          home: const CenterPage(),
        );
      },
    );
  }
}

class CenterPage extends StatelessWidget {
  const CenterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CenteterPageBloc(),
      child: CenterView(),
    );
  }
}

class CenterView extends StatelessWidget {
  const CenterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('bloc exemplos'),
      ),
      body: Center(
        child: BlocBuilder<CenteterPageBloc, String>(
          builder: (context, state) {
            // ignore: prefer_const_constructors
            return Text(
              state,
            );
          },
        ),
      ),
      floatingActionButton: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () {
                context.read<CenteterPageBloc>().add(CounterIncrementPressed());
              }),
          const SizedBox(
            height: 4,
          ),
          FloatingActionButton(
              child: Icon(Icons.remove),
              onPressed: () {
                context.read<CenteterPageBloc>().add(CounterDecrementPressed());
              }),
          const SizedBox(
            height: 4,
          ),
          FloatingActionButton(
              child: Icon(Icons.accessibility_new_sharp),
              onPressed: () {
                context.read<CenteterPageBloc>().add(MostraPessoas());
              }),
          const SizedBox(
            height: 4,
          ),
          FloatingActionButton(
              child: Icon(Icons.brightness_6),
              onPressed: () {
                context.read<ThemeCubit>().toggleTheme();
              })
        ],
      ),
    );
  }
}

abstract class EventsPage {}

class CounterIncrementPressed extends EventsPage {}

class CounterDecrementPressed extends EventsPage {}

class MostraPessoas extends EventsPage {}

class CenteterPageBloc extends Bloc<EventsPage, String> {
  CenteterPageBloc() : super('0') {
    var numer = int.parse(state);
    on<CounterIncrementPressed>((event, emit) => emit((numer++).toString()));
    on<CounterDecrementPressed>((event, emit) => emit((numer--).toString()));
    on<MostraPessoas>((event, emit) => emit('pedro'));
  }
}

class ThemeCubit extends Cubit<ThemeData> {
  ThemeCubit() : super(_lightTheme);

  static final _lightTheme = ThemeData(
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      foregroundColor: Colors.white,
    ),
    brightness: Brightness.light,
  );

  static final _darkTheme = ThemeData(
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      foregroundColor: Colors.black,
    ),
    brightness: Brightness.dark,
  );

  void toggleTheme() {
    emit(state.brightness == Brightness.dark ? _lightTheme : _darkTheme);
  }
}
