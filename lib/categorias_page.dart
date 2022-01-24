import 'package:flutter/material.dart';

class CategoriasPage extends StatefulWidget {
  const CategoriasPage({Key? key}) : super(key: key);

  @override
  _CategoriasPageState createState() => _CategoriasPageState();
}

class _CategoriasPageState extends State<CategoriasPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.red,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed('/carrinho');
            },
            icon: Icon(Icons.local_grocery_store),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            AppBaar(),
            Container(
              child: Hamburguerias(),
            )
          ],
        ),
      ),
    );
  }
}

class AppBaar extends StatelessWidget {
  const AppBaar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.1,
      child: Stack(
        children: [
          Container(
            height: size.height * 0.2 - 45,
            decoration: BoxDecoration(
              color: Colors.red,
            ),
          ),
          Positioned(
            top: 6,
            right: 0,
            left: 109,
            child: Text(
              'Hamburguerias',
              style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}

class Hamburguerias extends StatelessWidget {
  const Hamburguerias({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 5),
                  blurRadius: 8,
                  color: Colors.grey.withOpacity(0.20),
                ),
              ],
            ),
            child: Card(
              color: Colors.grey[200],
              child: Row(
                children: [
                  Container(
                      height: 150,
                      width: 150,
                      color: Colors.orange[300],
                      child: Image.asset('assets/imagens/grelha.png')),
                  Column(
                    children: [
                      TextButton(
                        onPressed: () =>
                            Navigator.of(context).pushNamed('/cardapio'),
                        child: Text(
                          'Na grelha',
                        ),
                      ),
                      Title(
                        color: Colors.grey,
                        child: Text(
                          '\tSão Mateus - MA\nRua Lino Machado',
                          textDirection: TextDirection.rtl,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 5),
                  blurRadius: 8,
                  color: Colors.grey.withOpacity(0.20),
                ),
              ],
            ),
            child: Card(
              color: Colors.grey[200],
              child: Row(
                children: [
                  Container(
                      height: 150,
                      width: 150,
                      color: Colors.orange[300],
                      child: Image.asset('assets/imagens/duarte.png')),
                  Column(
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'Duarte',
                        ),
                      ),
                      Title(
                        color: Colors.grey,
                        child: Text(
                          '\tSão Mateus - MA\nRua Lino Machado',
                          textDirection: TextDirection.rtl,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 5),
                  blurRadius: 8,
                  color: Colors.grey.withOpacity(0.20),
                ),
              ],
            ),
            child: Card(
              color: Colors.grey[200],
              child: Row(
                children: [
                  Container(
                    height: 150,
                    width: 150,
                    color: Colors.orange[300],
                    child: Image.asset('assets/imagens/miranda.png'),
                  ),
                  Column(
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'Miranda',
                        ),
                      ),
                      Title(
                        color: Colors.grey,
                        child: Text(
                          '\tSão Mateus - MA\nRua Lino Machado',
                          textDirection: TextDirection.rtl,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 5),
                  blurRadius: 8,
                  color: Colors.grey.withOpacity(0.20),
                ),
              ],
            ),
            child: Card(
              color: Colors.grey[200],
              child: Row(
                children: [
                  Container(
                      height: 150,
                      width: 150,
                      color: Colors.orange[300],
                      child: Image.asset('assets/imagens/brutos.png')),
                  Column(
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'Brutos',
                        ),
                      ),
                      Title(
                        color: Colors.grey,
                        child: Text(
                          '\tSão Mateus - MA\nRua Lino Machado',
                          textDirection: TextDirection.rtl,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 5),
                  blurRadius: 8,
                  color: Colors.grey.withOpacity(0.20),
                ),
              ],
            ),
            child: Card(
              color: Colors.grey[200],
              child: Row(
                children: [
                  Container(
                      height: 150,
                      width: 150,
                      color: Colors.orange[300],
                      child: Image.asset('assets/imagens/burguer.png')),
                  Column(
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'Burger Special',
                        ),
                      ),
                      Title(
                        color: Colors.grey,
                        child: Text(
                          '\tSão Mateus - MA\nRua Lino Machado',
                          textDirection: TextDirection.rtl,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
