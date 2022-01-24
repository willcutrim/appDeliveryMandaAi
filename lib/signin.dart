import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class Signin extends StatefulWidget {
  const Signin({Key? key}) : super(key: key);
  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  bool obscure = true;

  final _formkey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: SingleChildScrollView(
          child: SafeArea(
        child: Column(children: [
          Logotipo(),
          SizedBox(
            height: MediaQuery.of(context).size.height * .1,
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
            child: Form(
              key: _formkey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _emailController,
                    validator: (email) {
                      if (email == null || email.isEmpty) {
                        return 'Por favor, digite seu email.';
                      } else if (!RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(_emailController.text)) {
                        return 'Por favor, digite um email correto.';
                      }
                      return null;
                    },
                    cursorColor: Colors.white,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey[200],
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(10)),
                      label: Padding(
                        padding: EdgeInsetsDirectional.only(start: 10),
                        child: Text(
                          'E-mail',
                          style: TextStyle(
                            color: Colors.grey[600],
                          ),
                        ),
                      ),
                      prefixIcon: Padding(
                        padding: const EdgeInsetsDirectional.only(start: 12),
                        child: Icon(Icons.email),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  TextFormField(
                    controller: _senhaController,
                    validator: (senha) {
                      if (senha == null || senha.isEmpty) {
                        return 'Por favor, digite sua senha.';
                      } else if (senha.length < 2) {
                        return 'por favor, digite uma senha maior que 6 caracteres';
                      }
                      return null;
                    },
                    cursorColor: Colors.white,
                    obscureText: obscure,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey[200],
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(10)),
                      label: Padding(
                        padding: EdgeInsetsDirectional.only(start: 10),
                        child: Text(
                          'Senha',
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                      ),
                      prefixIcon: Padding(
                        padding: EdgeInsetsDirectional.only(start: 12),
                        child: Icon(Icons.vpn_key_rounded),
                      ),
                      suffixIcon: IconButton(
                        splashRadius: 1,
                        onPressed: () {
                          setState(() {
                            obscure = !obscure;
                          });
                        },
                        color: Colors.grey[600]!.withOpacity(0.7),
                        icon: Icon(
                            obscure ? Icons.visibility_off : Icons.visibility),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .10,
                  ),
                  Container(
                    width: 350,
                    height: 50,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      onPressed: () async {
                        FocusScopeNode currentFocus = FocusScope.of(context);
                        if (_formkey.currentState!.validate()) {
                          bool deuCerto = await login();
                          if (!currentFocus.hasPrimaryFocus) {
                            currentFocus.unfocus();
                          }
                          if (deuCerto) {
                            print(" status: ${deuCerto}");
                            Navigator.of(context).pushReplacementNamed('/home');
                          } else {
                            print('status: ${deuCerto}');
                            _senhaController.clear();
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          }
                        }
                      },
                      child: Text(
                        'Entrar',
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.red[900],
                            fontWeight: FontWeight.bold),
                      ),
                      color: Colors.yellow[800],
                    ),
                  ),
                  Container(
                    child: TextButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacementNamed('/home');
                      },
                      child: Text(
                        'Fazer isso depois',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.normal),
                      ),
                    ),
                  ),
                  Container(
                    child: TextButton(
                      onPressed: () {
                        Navigator.of(context)
                            .pushReplacementNamed('/cadastro_pessoa');
                      },
                      child: Text(
                        'Criar conta',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.normal),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ]),
      )),
    );
  }

  final snackBar = SnackBar(
    content: Text(
      'Email ou senha inválidos',
      textAlign: TextAlign.center,
    ),
    backgroundColor: Colors.black,
  );

  Future<bool> login() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    //https://reqres.in/api/login
    var url = Uri.parse('https://reqres.in/api/login');
    var resposta = await http.post(
      url,
      body: {
        'email': _emailController.text,
        'password': _senhaController.text,
      },
    );
    var token = jsonDecode(resposta.body)['token'];
    var status = resposta.statusCode;
    if (status == 200) {
      await sharedPreferences.setString('token,,', "Token ${token}");
      print('Status: {$status}');
      print('Token de Login: {$token}');

      return true;
    } else {
      print(jsonDecode(resposta.body));
      print(status);
      return false;
    }
  }
}

class Logotipo extends StatelessWidget {
  const Logotipo({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.asset(
        'assets/imagens/logo.png',
        height: 250,
      ),
    );
  }
}
