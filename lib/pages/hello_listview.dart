import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Dog {
  String nome;
  String foto;

  Dog(this.nome, this.foto);
}

class HelloListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ListView"),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.list), onPressed: (){},),
          IconButton(icon: Icon(Icons.grid_on), onPressed: (){},),
        ],
      ),
      body: _body(),

    );
  }

  _body() {

    List<Dog> dogs = [
      Dog("Fluidao","assets/images/dog1.jpg"),
      Dog("Rapadura","assets/images/dog2.jpeg"),
      Dog("Mosquito","assets/images/dog3.jpg"),
      Dog("Bob","assets/images/dog4.jpg"),
      Dog("Flash","assets/images/dog5.jpg"),
    ];
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemCount: dogs.length,
      itemBuilder: (context, index) {
        Dog d = dogs[index];
        return Stack(
          fit: StackFit.expand,
          children: <Widget>[
            _img(d.foto),
            Align (
              alignment: Alignment.bottomRight,
              child: Container(
                margin: EdgeInsets.all(12),
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.yellow,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Text(d.nome, style: TextStyle(
                  color: Colors.pink,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),),
              ),
            )
          ],
        );
      },
    );
  }


//    return ListView.builder(
//      itemCount: dogs.length,
//      itemExtent: 350,
//      itemBuilder: (context, index) {
//        Dog d = dogs[index];
//        return Stack(
//          fit: StackFit.expand,
//          children: <Widget>[
//            _img(d.foto),
//            Align (
//              alignment: Alignment.bottomRight,
//              child: Container(
//                margin: EdgeInsets.all(12),
//                padding: EdgeInsets.all(12),
//                decoration: BoxDecoration(
//                  color: Colors.yellow,
//                  borderRadius: BorderRadius.circular(16),
//                ),
//                child: Text(d.nome, style: TextStyle(
//                  color: Colors.pink,
//                  fontSize: 30,
//                  fontWeight: FontWeight.bold,
//                ),),
//              ),
//            )
//          ],
//        );
//      },
//    );
//  }

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
