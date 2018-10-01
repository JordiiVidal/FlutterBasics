import 'package:flutter/material.dart';
import './pages/auth.dart';
import './pages/products_admin.dart';
import './pages/home.dart';

//import 'package:flutter/rendering.dart';

void main() {
  /*debugPaintSizeEnabled = true;//whitout debugging
    debugPaintBaselinesEnabled = true;
    debugPaintPointersEnabled = true;
    debugPaintSizeEnabled = true;*/
  runApp(MyApp());
}

//void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        //debugShowMaterialGrid: true,//tool grid for design
        theme: ThemeData(
            brightness: Brightness.light, //default exists dark
            primarySwatch: Colors.deepOrange, //static properties
            accentColor: Colors.purple),
        //home: AuthPage(), Home argunment la pagina que primero veremos la podemos cambiar por la ruta /
        routes: {
          '/admin': (BuildContext context) => ProductsAdminPage(),
          '/': (BuildContext context) => HomePage(),//homeroute,(home argument) cuando se haga el login no queremos que nos salga otra vez la pagina de login 
        });
  }
}
