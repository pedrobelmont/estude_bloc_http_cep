import 'package:flutter/material.dart';

class TelaErro extends StatelessWidget {
  const TelaErro({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('erro na procura do cep',
            style: TextStyle(color: Colors.red, fontSize: 20.0)),
        Icon(Icons.web_asset_off)
      ],
    );
  }
}
