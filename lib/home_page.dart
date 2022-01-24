import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String nome = 'willyam cutrim';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              padding: EdgeInsets.fromLTRB(10, 50, 0, 0),
              decoration: BoxDecoration(color: Colors.red),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 15,
                  ),
                  CircleAvatar(
                    child: Icon(Icons.person),
                    backgroundColor: Colors.amberAccent,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Title(
                    color: Colors.black,
                    child: Text('${nome}'),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.logout_sharp),
              title: Text('Sair'),
              onTap: () async {
                bool saiu = await sair();
                if (saiu) {
                  Navigator.of(context).pushReplacementNamed('/boas');
                }
              },
            )
          ],
        ),
      ),
      appBar: AppBar(
        toolbarHeight: 40,
        elevation: 0,
        backgroundColor: Colors.red,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeaderSearch(),
            Container(
              height: 20,
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 67 * 4),
                    child: Text(
                      'Categorias',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      margin: EdgeInsets.only(right: 67 * 4),
                      height: 4,
                      color: Colors.red.withOpacity(0.2),
                    ),
                  ),
                ],
              ),
            ),
            Categorias(),
            SizedBox(
              height: 30,
            ),
            Container(
              height: 24,
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 52 * 4),
                    child: Text(
                      'Estabelecimentos',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      margin: EdgeInsets.only(right: 52 * 4),
                      height: 4,
                      color: Colors.red.withOpacity(0.2),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Estabelecimentos()
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedIconTheme: IconThemeData(color: Colors.white, size: 30),
        backgroundColor: Colors.red,
        selectedItemColor: Colors.white,
        items: [
          BottomNavigationBarItem(
            title: Text('home'),
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            title: Text('Pedidos'),
            icon: Icon(Icons.shopping_cart),
          ),
        ],
      ),
    );
  }
}

Future<bool> sair() async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  await sharedPreferences.clear();
  return true;
}

class HeaderSearch extends StatelessWidget {
  const HeaderSearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(bottom: 15 * 2.0),
      height: size.height * 0.2,
      child: Stack(
        children: [
          Container(
            height: size.height * 0.2 - 25,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10)),
              color: Colors.red,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                'assets/imagens/logo.png',
                height: 105,
              ),
              IconButton(
                onPressed: () async {
                  bool saiu = await sair();
                  if (saiu) {
                    print(saiu);
                    Navigator.of(context).pushReplacementNamed('/boas');
                  }
                },
                icon: Icon(
                  Icons.logout_outlined,
                  color: Colors.yellowAccent[700],
                  size: 30,
                ),
              )
            ],
          ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 10),
                      blurRadius: 50,
                      color: Colors.red.withOpacity(0.23)),
                ],
                borderRadius: BorderRadius.circular(
                  10,
                ),
              ),
              margin: EdgeInsets.symmetric(horizontal: 30.0),
              child: TextField(
                cursorColor: Colors.white,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[200],
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(15)),
                  prefixIcon: Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                    child: Icon(Icons.search),
                  ),
                  label: Text(
                    '\t\tO que você deseja pedir?',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Categorias extends StatelessWidget {
  //const Categorias({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(16, 15, 20, 0),
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Card(
                elevation: 6.0,
                color: Colors.grey[200],
                child: Column(
                  children: [
                    Image.asset(
                      'assets/icons/hamburgue_refri.png',
                      height: 100,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed('/categorias');
                      },
                      child: Text(
                        'Hamburguerias',
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Card(
                elevation: 6.0,
                color: Colors.grey[200],
                child: Column(
                  children: [
                    Image.asset(
                      'assets/icons/pizza.png',
                      height: 100,
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'Pizzarias',
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Card(
                elevation: 6.0,
                color: Colors.grey[200],
                child: Column(
                  children: [
                    Image.asset(
                      'assets/icons/suco.png',
                      height: 100,
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'Lanchonetes',
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                width: 20,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class Estabelecimentos extends StatelessWidget {
  //const Estabelecimentos({Key? key}) : super(key: key);
  String cidade = 'São mateus do maranhão';
  String bairro = 'Piqui';
  String rua = 'Lino machado';
  int numeroDaCasa = 145;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Card(
                elevation: 5,
                color: Colors.grey[200],
                child: Row(
                  children: [
                    Container(
                      height: 150,
                      width: 150,
                      color: Colors.orange[300],
                      child:
                          Image.asset('assets/imagens/pizzaria_delivery.png'),
                    ),
                    Column(
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            'Pizzaria delivery',
                          ),
                        ),
                        Title(
                          color: Colors.grey,
                          child: Text(
                            '${cidade}\n${bairro}, ${rua}, ${numeroDaCasa}',
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 35,
              ),
              Card(
                elevation: 5,
                color: Colors.grey[200],
                child: Row(
                  children: [
                    Container(
                        height: 150,
                        width: 150,
                        color: Colors.orange[300],
                        child:
                            Image.asset('assets/imagens/pizzaria_da_casa.png')),
                    Column(
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            'Pizzaria da Casa',
                          ),
                        ),
                        Title(
                          color: Colors.grey,
                          child: Text(
                            '${cidade}\n${bairro}, ${rua}, ${numeroDaCasa}',
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 35,
              ),
              Card(
                elevation: 5,
                color: Colors.grey[200],
                child: Row(
                  children: [
                    Container(
                      height: 150,
                      width: 150,
                      color: Colors.orange[300],
                      child: Image.asset('assets/imagens/burguer.png'),
                    ),
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
                            '${cidade}\n${bairro}, ${rua}, ${numeroDaCasa}',
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 35,
              ),
              Card(
                elevation: 5,
                color: Colors.grey[200],
                child: Row(
                  children: [
                    Container(
                      height: 150,
                      width: 150,
                      color: Colors.orange[300],
                      child: Image.asset('assets/imagens/brutos.png'),
                    ),
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
                            '${cidade}\n${bairro}, ${rua}, ${numeroDaCasa}',
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
