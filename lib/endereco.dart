import 'package:fast_delivery/signin.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class Endereco extends StatefulWidget {
  const Endereco({Key? key}) : super(key: key);

  @override
  _EnderecoState createState() => _EnderecoState();
}

class _EnderecoState extends State<Endereco> {
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
            Logotipo(),
            Container(
              padding: EdgeInsets.fromLTRB(0, 45, 225, 0),
              child: Text(
                'Endereço',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Bairro',
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
                  SizedBox(
                    height: 16,
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Rua',
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
                  SizedBox(
                    height: 16,
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Nº da casa',
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
                  SizedBox(
                    height: 60,
                  ),
                  Container(
                    width: 335,
                    height: 45,
                    child: RaisedButton(
                      color: Colors.yellow[800],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      onPressed: () {},
                      child: Text(
                        'Cadastrar',
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.red[900],
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  )
                ],
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
            width: 5,
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
