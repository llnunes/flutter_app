import 'package:flutter/material.dart';
import 'package:flutter_app/drawer_list.dart';
import 'package:flutter_app/pages/hello_listview.dart';
import 'package:flutter_app/pages/hello_page2.dart';
import 'package:flutter_app/pages/hello_page3.dart';
import 'package:flutter_app/util/nav.dart';
import 'package:flutter_app/widgets/blue_button.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HomeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Hello Flutter S",
          ),
          centerTitle: true,
          bottom: TabBar(tabs: <Widget>[
            Tab(text: "Tab 1"),
            Tab(text: "Tab 2"),
          ],),
        ),
        body: TabBarView(
          children: <Widget>[
            _body(context),
            Container(
              color: Colors.yellow,
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            print("T");
          },
        ),
        drawer: DrawerList(),
      ),
    );
  }

  _body(context) {
    return Container(
      padding: EdgeInsets.only(top: 16),
      color: Colors.white,
//      child: SizedBox.expand(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          _text(),
          _pageView(),
          _buttons(),
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

  _buttons() {
    return Builder(
      builder: (BuildContext context) {
        return Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                BlueButton("ListView",
                    onPressed: () =>
                        _onClickNavigator(context, HelloListView())),
                BlueButton("Page 2",
                    onPressed: () => _onClickNavigator(context, HelloPage2())),
                BlueButton("Page 3",
                    onPressed: () => _onClickNavigator(context, HelloPage3())),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                BlueButton("Snack", onPressed: () => _onClickSnack(context)),
                BlueButton("Dialog", onPressed: () => _onClickDialog(context)),
                BlueButton("Toast", onPressed: _onClickToast),
              ],
            ),
          ],
        );
      },
    );
  }

  _onClickSnack(context) {
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text("Teste"),
      action: SnackBarAction(
        textColor: Colors.yellow,
        label: "OK",
        onPressed: () {},
      ),
    ));
  }

  _onClickDialog(BuildContext context) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return WillPopScope(
            onWillPop: () async => false,
            child: AlertDialog(
              title: Text("Alerta dialogo"),
              actions: <Widget>[
                FlatButton(
                  child: Text("Cancelar"),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                FlatButton(
                    child: Text("OK"),
                    onPressed: () {
                      Navigator.pop(context);
                    }),
              ],
            ),
          );
        });
  }

  _onClickToast() {
    Fluttertoast.showToast(
        msg: "This is Center Short Toast",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        timeInSecForIos: 5,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
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

  void _onClickNavigator(BuildContext context, Widget page) async {
    String s = await push(context, page);
    print("$s");
  }
}
