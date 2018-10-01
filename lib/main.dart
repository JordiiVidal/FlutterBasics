import 'package:flutter/material.dart';
import './pages/auth.dart';

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
      home: AuthPage(),
    );
  }
}
