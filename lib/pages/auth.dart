import 'package:flutter/material.dart';

import 'package:scoped_model/scoped_model.dart';

import '../scoped-models/main.dart';

class AuthPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _AuthPage();
  }
}

class _AuthPage extends State<AuthPage> {
  final Map<String, dynamic> _formData = {
    'email': null,
    'password': null,
    'term': false,
  };

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  DecorationImage _buildBackgroundImage() {
    return DecorationImage(
      fit: BoxFit.cover, //zoom
      colorFilter:
          ColorFilter.mode(Colors.black.withOpacity(0.2), BlendMode.dstATop),
      image: AssetImage('assets/background.jpg'),
    );
  }

  Widget _buildEmailTextField() {
    return TextFormField(
      decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          /*icon: Icon(Icons.link)*/ labelText: 'E-mail'),
      keyboardType: TextInputType.emailAddress,
      validator: (String value) {
        if (value.isEmpty ||
            RegExp(r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
                .hasMatch(value)) {
          return 'Please enter valid email';
        }
      },
      onSaved: (String value) {
        _formData['email'] = value;
      },
    );
  }

  Widget _buildPasswordTextField() {
    return TextFormField(
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        labelText: 'Password',
      ),
      obscureText: true,
      validator: (String value) {
        if (value.isEmpty || value.length < 6) {
          return 'Please enter valid password';
        }
      },
      onSaved: (String value) {
        _formData['password'] = value;
      },
    );
  }

  Widget _buildAcceptSwitch() {
    return SwitchListTile(
      title: Text('Accept Terms'),
      value: _formData['term'],
      activeColor: Colors.pink,
      onChanged: (bool value) {
        setState(() {
          _formData['term'] = value;
        });
      },
    );
  }

  void _submitForm(Function login) {
    if (!_formKey.currentState.validate() || !_formData['term']) {
      //only return true if all are succesed
      return;
    }
    _formKey.currentState.save();
    login(_formData['email'], _formData['password']);
    print(_formData);

    Navigator.pushReplacementNamed(context, '/products');
    //Navigator siempre que se quiera cambiar de pagina(always)
  }

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final Orientation deviceOrientation = MediaQuery.of(context).orientation;
    final targetWidthO =
        deviceOrientation == Orientation.landscape ? 200.0 : 500.0; //IF / ELSE
    final targetWidth = deviceWidth > 550.0 ? 500.0 : deviceWidth * 0.95;
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
              child: Form(
                key: _formKey,
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
                    ScopedModelDescendant<MainModel>(
                      builder: (BuildContext context, Widget widget,
                          MainModel model) {
                        return RaisedButton(
                          textColor: Colors.white,
                          child: Text('login'),
                          onPressed: () => _submitForm(model.login),
                        );
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
