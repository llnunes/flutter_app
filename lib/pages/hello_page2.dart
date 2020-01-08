import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/blue_button.dart';

class HelloPage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pagina 2"),
      ),
      body: _body(context),
    );
  }

  _body(context) {
    return Center(
      child: BlueButton("Teste 2", onPressed: () => _onClickNavigator(context)),
    );
  }

  void _onClickNavigator(context) {
    Navigator.pop(context, "Tela 3");
  }
}
