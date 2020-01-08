import 'package:flutter/material.dart';

class HelloListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ListView"),
      ),
      body: _body(),

    );
  }

  _body() {
    return ListView(
      itemExtent: 350,
      children: <Widget>[
        _img("assets/images/dog1.jpg"),
        _img("assets/images/dog2.jpeg"),
        _img("assets/images/dog3.jpg"),
        _img("assets/images/dog4.jpg"),
        _img("assets/images/dog5.jpg"),
      ],
    );
  }

  _img(source) {
//    return Image.network("https://abrilvejario.files.wordpress.com/2016/12/3659_cachorro2.jpeg");
    return Image.asset(
      source,
      fit: BoxFit.cover,
//      height: 300,
//      width: 300,
    );
  }
}
