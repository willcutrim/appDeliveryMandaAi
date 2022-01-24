import 'package:fast_delivery/cadastro_person.dart';
import 'package:fast_delivery/cardapio_page.dart';
import 'package:fast_delivery/cart_page.dart';
import 'package:fast_delivery/endereco.dart';
import 'package:fast_delivery/signin.dart';
import 'package:flutter/material.dart';

import 'boas_vindas.dart';
import 'categorias_page.dart';
import 'home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  Color get colorRed => const Color(0xFF42A5F5);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fast Delivery',
      debugShowCheckedModeBanner: false,
      initialRoute: '/login',
      routes: {
        '/login': (context) => Signin(),
        '/home': (context) => HomePage(),
        '/cadastro_pessoa': (context) => CadastroPage(),
        '/endereco': (context) => Endereco(),
        '/categorias': (context) => CategoriasPage(),
        '/cardapio': (context) => CardapioPage(),
        '/carrinho': (context) => CartPage(),
        '/boas': (context) => BoasvindasPage()
      },
    );
  }
}
