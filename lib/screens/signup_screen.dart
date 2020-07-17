import 'package:flutter/material.dart';

class SignupScreen extends StatelessWidget {

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Criar Conta"),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          physics: NeverScrollableScrollPhysics(),
          padding: EdgeInsets.all(16),
          children: <Widget>[
            TextFormField(
              validator: (text) {
                if (text.isEmpty) {
                  return "Nome inválido";
                }
                return null;
              },
              decoration: InputDecoration(
                  hintText: "Nome"
              )
            ),
            SizedBox(height: 16),
            TextFormField(
              validator: (text) {
                if (text.isEmpty || !text.contains("@")) {
                  return "E-mail inválido";
                }
                return null;
              },
              decoration: InputDecoration(
                  hintText: "E-mail"
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 16),
            TextFormField(
              validator: (text) {
                if (text.isEmpty || text.length < 6) {
                  return "Senha inválida";
                }
                return null;
              },
              decoration: InputDecoration(
                  hintText: "Senha"
              ),
              obscureText: true,
            ),
            SizedBox(height: 16),
            TextFormField(
              validator: (text) {
                if(text.isEmpty) {
                  return "Endereço inválido";
                }
                return null;
              },
              decoration: InputDecoration(
                  hintText: "Endereço"
              ),
            ),
            SizedBox(height: 16),
            SizedBox(height: 44,
                child: RaisedButton(
                  child: Text("Entrar",
                      style: TextStyle(
                          fontSize: 18
                      )
                  ),
                  textColor: Colors.white,
                  color: Theme.of(context).primaryColor,
                  onPressed: () {
                    if (_formKey.currentState.validate()) {

                    }
                  },
                )
            )
          ],
        ),
      ),
    );;
  }
}
