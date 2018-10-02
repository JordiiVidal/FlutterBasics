import 'package:flutter/material.dart';
import './pages/products_admin.dart';
import './pages/home.dart';
import './pages/product.dart';

//import 'package:flutter/rendering.dart';

void main() {
  /*debugPaintSizeEnabled = true;//whitout debugging
    debugPaintBaselinesEnabled = true;
    debugPaintPointersEnabled = true;
    debugPaintSizeEnabled = true;*/
  runApp(MyApp());
}

//void main() => runApp(MyApp());
class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  List<Map<String, dynamic>> _products = [];

  void _addProduct(Map<String, dynamic> product) {
    //use dynamic <dynamic>
    setState(() {
      _products.add(product);
      print(_products);
    });
  }

  void _deleteProduct(int index) {
    setState(() {
      _products.removeAt(index);
      print(_products);
    });
  }

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
        '/': (BuildContext context) => HomePage(_products), //homeroute,(home argument) cuando se haga el login no queremos que nos salga otra vez la pagina de login
        '/admin': (BuildContext context) => ProductsAdminPage(_addProduct,_deleteProduct),
      }, //executed whemn we navigate to a named rout solo se ejecutara cuando no este en el registro routes
      onGenerateRoute: (RouteSettings settings) {
        final List<String> pathElements = settings.name.split('/');
        if (pathElements[0] != '') {
          return null; //invalid name por lo tanto no va hacer load de una nueva page
        }
        if (pathElements[1] == 'product') {
          //directorio /products list of all products
          final int index = int.parse(pathElements[2]); // /products/1
          return MaterialPageRoute<bool>(
            builder: (BuildContext context) => ProductPage(
                _products[index]['title'], _products[index]['image']),
          );
        }
      },//Cuando no pasa por las routas con nombre y cuando devulve un null el ongenerate llega aqui
      onUnknownRoute: (RouteSettings settings) {
        return MaterialPageRoute(builder: (BuildContext context) => HomePage(_products));
      },
    );
  }
}
