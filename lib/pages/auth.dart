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

  DecorationImage _buildBackgroundImage() {
    return DecorationImage(
      fit: BoxFit.cover, //zoom
      colorFilter:
          ColorFilter.mode(Colors.black.withOpacity(0.2), BlendMode.dstATop),
      image: AssetImage('assets/background.jpg'),
    );
  }

  Widget _buildEmailTextField() {
    return TextField(
      decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          /*icon: Icon(Icons.link)*/ labelText: 'E-mail'),
      keyboardType: TextInputType.emailAddress,
      onChanged: (String value) {
        setState(() {
          _emailValue = value;
        });
      },
    );
  }

  Widget _buildPasswordTextField() {
    return TextField(
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        labelText: 'Password',
      ),
      obscureText: true,
      onChanged: (String value) {
        setState(() {
          _pswdValue = value;
        });
      },
    );
  }

  Widget _buildAcceptSwitch() {
    return SwitchListTile(
      title: Text('Accept Terms'),
      value: _acceptTerms,
      activeColor: Colors.pink,
      onChanged: (bool value) {
        setState(() {
          _acceptTerms = value;
        });
      },
    );
  }

  void _submitForm() {
    print(_pswdValue);
    print(_emailValue);
    Navigator.pushReplacementNamed(context, '/products');
    //Navigator siempre que se quiera cambiar de pagina(always)
  }

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final Orientation deviceOrientation = MediaQuery.of(context).orientation;
    final targetWidthO = deviceOrientation == Orientation.landscape ? 200.0 : 500.0;//IF / ELSE
    final targetWidth =  deviceWidth >550.0 ? 500.0 :  deviceWidth * 0.95 ;
    /*IF(DEVICEWidth > 550){
      return Scaff
    }else{return scaffodld2}*/      
    
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Container(
        decoration: BoxDecoration(image: _buildBackgroundImage()),
        padding: EdgeInsets.all(10.0),
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              width: targetWidth,
              //width: MediaQuery.of(context).size.width * 0.8,//80%
              child: Column(
                children: <Widget>[
                  _buildEmailTextField(),
                  SizedBox(
                    height: 10.0,
                  ),
                  _buildPasswordTextField(),
                  SizedBox(
                    height: 20.0,
                  ),
                  Switch(
                    value: true,
                    activeColor: Colors.pink,
                    activeTrackColor: Colors.grey,
                    onChanged: (bool value) {},
                  ),
                  _buildAcceptSwitch(),
                  SizedBox(
                    height: 20.0,
                  ),
                  RaisedButton(
                    textColor: Colors.white,
                    child: Text('login'),
                    onPressed: _submitForm,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
