import 'package:flutter/material.dart';

class CardapioPage extends StatefulWidget {
  @override
  State<CardapioPage> createState() => _CardapioPageState();
}

class _CardapioPageState extends State<CardapioPage> {
  int cont = 0;
  // _CardapioPageState(this.cont);
  void incremente() {
    setState(() {
      cont++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.red,
        actions: [
          IconButton(
            tooltip: '${cont}',
            onPressed: () {
              Navigator.of(context).pushNamed('/carrinho');
            },
            icon: Icon(
              Icons.shopping_cart,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            AppBaarCardapio(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
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
                  elevation: 5,
                  color: Colors.grey[200],
                  child: Row(
                    children: [
                      Container(
                        height: 150,
                        width: 150,
                        color: Colors.orange[300],
                        child: Image.asset('assets/hamburguer/brasas.png'),
                      ),
                      Column(
                        children: [
                          Text(
                            'Brasas Chef',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Carne artesanal, bacon, calabresa,queijo,\ncebola caramelizada, acelga ou alface.',
                            style: TextStyle(fontSize: 12),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 5, 70, 0),
                            child: Row(
                              children: [
                                Text(
                                  '9,99',
                                  style: TextStyle(
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  width: 30,
                                ),
                                IconButton(
                                  onPressed: () {
                                    incremente();
                                  },
                                  icon: Icon(
                                    Icons.shopping_cart,
                                    color: Colors.grey[800],
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            /*
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CardDeComidas(),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CardDeComidas(),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CardDeComidas(),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CardDeComidas(),
            ),
            */
          ],
        ),
      ),
    );
  }
}

class AppBaarCardapio extends StatefulWidget {
  const AppBaarCardapio({Key? key}) : super(key: key);

  @override
  State<AppBaarCardapio> createState() => _AppBaarCardapioState();
}

class _AppBaarCardapioState extends State<AppBaarCardapio> {
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
            top: 0,
            right: 0,
            left: 95,
            bottom: 5,
            child: Row(
              children: [
                Image.asset(
                  'assets/imagens/grelha.png',
                  height: 80,
                ),
                Text(
                  'Na Grelha',
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class CardDeComidas extends StatefulWidget {
  const CardDeComidas({Key? key}) : super(key: key);
  @override
  State<CardDeComidas> createState() => CardDeComidasState();
}

class CardDeComidasState extends State<CardDeComidas> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
        elevation: 5,
        color: Colors.grey[200],
        child: Row(
          children: [
            Container(
              height: 150,
              width: 150,
              color: Colors.orange[300],
              child: Image.asset('assets/hamburguer/brasas.png'),
            ),
            Column(
              children: [
                Text(
                  'Brasas Chef',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Carne artesanal, bacon, calabresa,queijo,\ncebola caramelizada, acelga ou alface.',
                  style: TextStyle(fontSize: 12),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 5, 70, 0),
                  child: Row(
                    children: [
                      Text(
                        '9,99',
                        style: TextStyle(
                            color: Colors.green, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.shopping_cart,
                          color: Colors.grey[800],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
