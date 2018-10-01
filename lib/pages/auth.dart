import 'package:flutter/material.dart';

import 'home.dart';

class AuthPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Center(
          child: RaisedButton(
        child: Text('login'),
        onPressed: () {
          //Navigator siempre que se quiera cambiar de pagina(always)
          Navigator.pushReplacement(//Significa que la pagina actual sera completamente replacada por la otra y no permite tirar atras
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => HomePage(),
            ),
          ); 
        },
      )),
    );
  }
}
