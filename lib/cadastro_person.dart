import 'package:fast_delivery/endereco.dart';
import 'package:fast_delivery/signin.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class CadastroPage extends StatefulWidget {
  const CadastroPage({Key? key}) : super(key: key);

  @override
  State<CadastroPage> createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  String senha = '';
  String confirme_senha = '';
  String _nome_completo = '';

  String get nome_completo => _nome_completo;

  set nome_completo(String nome_completo) {
    _nome_completo = nome_completo;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 38,
        backgroundColor: Colors.red,
        elevation: 0,
      ),
      backgroundColor: Colors.red,
      body: SingleChildScrollView(
        child: Column(
          children: [
            //SizedBox(height: MediaQuery.of(context).size.height * 0.1),
            SafeArea(
              child: Logotipo(),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(0, 45, 150, 0),
              child: Text(
                'Dados pessoais',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Nome completo',
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        filled: true,
                        fillColor: Colors.grey[200],
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onSaved: (_nome_completo) =>
                          setState(() => _nome_completo = _nome_completo),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                    child: TextFormField(
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        labelText: 'Número de telefone',
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        filled: true,
                        fillColor: Colors.grey[200],
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                    child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: 'E-mail',
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        filled: true,
                        fillColor: Colors.grey[200],
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                    child: TextFormField(
                      onChanged: (text) {
                        senha = text;
                      },
                      decoration: InputDecoration(
                        labelText: 'Senha',
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        filled: true,
                        fillColor: Colors.grey[200],
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 20, 0, 20),
                    child: TextFormField(
                      onChanged: (text) {
                        confirme_senha = text;
                      },
                      validator: (value) {
                        if (confirme_senha.isEmpty) {
                          return 'Veja se a senha é mesma';
                        }
                      },
                      decoration: InputDecoration(
                        labelText: 'Confirme sua senha',
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        filled: true,
                        fillColor: Colors.grey[200],
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Container(
              width: 335,
              height: 45,
              child: RaisedButton(
                color: Colors.yellow[800],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                onPressed: () => Navigator.push(
                    context,
                    PageTransition(
                        duration: Duration(milliseconds: 450),
                        child: Endereco(),
                        type: PageTransitionType.rightToLeft)),
                child: Text(
                  'Continuar',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.red[900],
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed('/login');
                },
                child: Text(
                  'Cancelar',
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
    );
  }
}

class Logotipo extends StatelessWidget {
  const Logotipo({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/imagens/logo.png',
            height: 95,
          ),
          SizedBox(
            width: 2,
          ),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Cadastro',
                  style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                Text(
                  'Faça seu pedido rápido.',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white60),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
