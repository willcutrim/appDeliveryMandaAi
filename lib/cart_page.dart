import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.red,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            AppBaar(),
            Pedidos(),
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
            left: 148,
            child: Text(
              'Carrinho',
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

class Pedidos extends StatefulWidget {
  const Pedidos({Key? key}) : super(key: key);

  @override
  _PedidosState createState() => _PedidosState();
}

class _PedidosState extends State<Pedidos> {
  int cont = 1;
  double valor = 9.99;
  void inremente() {
    setState(() {
      cont++;
    });
  }

  void remove() {
    setState(() {
      cont = cont;
      if (cont > 0) {
        cont--;
      } else {
        print('n pode');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
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
                  Container(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          child: Text(
                            'Brasas Chef',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 15,
                            ),
                            Text(
                              '9.99',
                              style: TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 50,
                            ),
                            IconButton(
                              onPressed: () {},
                              icon:
                                  Icon(Icons.delete, color: Colors.orange[900]),
                              splashRadius: 20.0,
                            )
                          ],
                        ),
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                remove();
                              },
                              icon: Icon(
                                Icons.remove,
                                size: 15,
                              ),
                              splashRadius: 20.0,
                            ),
                            Text('${cont}'),
                            IconButton(
                              onPressed: () {
                                inremente();
                              },
                              icon: Icon(
                                Icons.add,
                                size: 15,
                              ),
                              splashRadius: 20.0,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              '9,99',
                              style: TextStyle(
                                  fontSize: 15, color: Colors.grey[850]),
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Column(
              children: [
                Text(
                  'Total do pedido',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                Text(
                  'R\$ 00,00',
                  style: TextStyle(
                      color: Colors.green, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Align(
            alignment: FractionalOffset.bottomCenter,
            child: Container(
              alignment: Alignment.bottomRight,
              height: 45,
              width: 250,
              child: RaisedButton(
                onPressed: () {},
                color: Colors.green,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Confirmar pedido',
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                    SizedBox(
                      width: 50,
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.check_circle,
                        color: Colors.white,
                      ),
                      splashRadius: 1,
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
