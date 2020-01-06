import 'package:flutter/material.dart';

class HelloPage1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pagina 1"),
      ),
      body: _body(context),
    );
  }

  _body(context) {
    return Center(
      child: RaisedButton(
        onPressed: () => _onClickNavigator(context),
        color: Colors.lightBlue,
        child: Text("Teste", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
      ),
    );
  }

  void _onClickNavigator(context) {
    Navigator.pop(context, "Tela 2");
  }
}
