import 'package:flutter/cupertino.dart';

import '../model/model.dart';

//Estados ****************************
abstract class TreeState {}

class BuscandoCepState extends TreeState {}

class CepCarregadoComSucesso extends TreeState {
  final Enderco endercoCarregado;
  CepCarregadoComSucesso(this.endercoCarregado);
}

class IniciaState extends TreeState {}

class ErroAuBuscarCep extends TreeState {}

//Eventos ***************************************************
abstract class TreeEvets {}

class EntradaDoCep extends TreeEvets {
  final String text;
  EntradaDoCep({required this.text});
}

class Buscarpelocep extends TreeEvets {}
