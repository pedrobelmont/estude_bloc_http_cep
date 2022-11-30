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

class Buscarpelocep extends TreeEvets {}
