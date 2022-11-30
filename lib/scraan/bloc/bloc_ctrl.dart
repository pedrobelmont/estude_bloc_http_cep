import '../Tree/Tree.dart';
import '../model/model.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:developer';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class ApiCubit extends Bloc<TreeEvets, TreeState> {
  ApiCubit() : super(IniciaState()) {
    on<Buscarpelocep>((event, emit) async {
      emit(BuscandoCepState());

      var client = http.Client();
      var response = await client.get(
          Uri.parse('https://viacep.com.br/ws/01001000/json/'),
          headers: {});
      if (response.statusCode == 200) {
        var jsonResponse = convert.jsonDecode(response.body);
        //modelar o dado
        log('resposta json: $jsonResponse.');

        var enderecoViaCep = Enderco().fromJson(jsonResponse);
        emit(CepCarregadoComSucesso(enderecoViaCep));
      } else {
        log('Request failed with status: ${response.statusCode}.');
        emit(ErroAuBuscarCep());
      }
    });
    // on<EntradaDoCep>((event, emit) => emit(state));
  }
}
