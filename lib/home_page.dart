import 'package:flutter/material.dart';
import 'package:flutter_app/pages/hello_page1.dart';
import 'package:flutter_app/pages/hello_page2.dart';
import 'package:flutter_app/pages/hello_page3.dart';

class HomeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Hello Flutter S",
        ),
        centerTitle: true,
      ),
      body: _body(context),
    );
  }

  _body(context) {
    return Container(
      color: Colors.white,
//      child: SizedBox.expand(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _text(),
          _pageView(),
          _buttons(context),
        ],
      ),
    );
  }

  _pageView() {
    return Container(
      margin: EdgeInsets.all(20),
      height: 300,
      child: PageView(
        children: <Widget>[
          _img("assets/images/dog1.jpg"),
          _img("assets/images/dog2.jpeg"),
          _img("assets/images/dog3.jpg"),
          _img("assets/images/dog4.jpg"),
          _img("assets/images/dog5.jpg"),
        ],
      ),
    );
  }

  _buttons(context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            _button(context, "ListView", () => _onClickNavigator(context, HelloPage1())),
            _button(context, "Page 2", () => _onClickNavigator(context, HelloPage2())),
            _button(context, "Page 3", () => _onClickNavigator(context, HelloPage3())),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            _button(context, "Snack", _onClickSnack),
            _button(context, "Dialog", _onClickDialog),
            _button(context, "Toast", _onClickToast),
          ],
        ),
      ],
    );
  }
  _onClickSnack() {

  }
  _onClickDialog () {

  }
  _onClickToast() {

  }

  _button(context, text, function) {
    return RaisedButton(
      child: Text(
        text,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
      onPressed: function,
    );
  }

  _text() {
    return Text("PetShop DogShow",
        style: TextStyle(
          fontSize: 30,
          fontStyle: FontStyle.italic,
          color: Colors.blue,
          fontWeight: FontWeight.bold,
          decoration: TextDecoration.underline,
          decorationStyle: TextDecorationStyle.wavy,
          decorationColor: Colors.red,
        ));
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

  void _onClickNavigator(context, Widget page) async{
    String s = await Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
      return page;
    }));
    print("$s");
  }
}
