import 'package:flutter/material.dart';

import 'home.dart';

class AuthPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _AuthPage();
  }
}

class _AuthPage extends State<AuthPage> {
  String _emailValue;
  String _pswdValue;
  bool _acceptTerms = false;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text('Login'),
        ),
        body: Container(
          margin: EdgeInsets.all(10.0),
          child: ListView(
            children: <Widget>[
              TextField(
                decoration: InputDecoration(
                    /*icon: Icon(Icons.link)*/ labelText: 'E-mail'),
                keyboardType: TextInputType.emailAddress,
                onChanged: (String value) {
                  setState(() {
                    _emailValue = value;
                  });
                },
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Password',
                ),
                obscureText: true,
                onChanged: (String value) {
                  setState(() {
                    _pswdValue = value;
                  });
                },
              ),
              SizedBox(
                height: 20.0,
              ),
              Switch(
                value: true,
                activeColor: Colors.pink,
                activeTrackColor: Colors.grey,
                onChanged: (bool value) {},
              ),
              SwitchListTile(
                title: Text('Accept Terms'),
                value: _acceptTerms,
                activeColor: Colors.pink,
                onChanged: (bool value) {
                  setState(() {
                    _acceptTerms = value;
                  });
                },
              ),
              SizedBox(
                height: 20.0,
              ),
              RaisedButton(
                color: Theme.of(context).primaryColorDark,
                textColor: Colors.white,
                child: Text('login'),
                onPressed: () {
                  //Navigator siempre que se quiera cambiar de pagina(always)
                  print(_pswdValue);
                  print(_emailValue);
                  Navigator.pushReplacementNamed(context, '/products');
                },
              )
            ],
          ),
        ));
  }
}
