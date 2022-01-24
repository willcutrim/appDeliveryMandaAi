import 'package:fast_delivery/home_page.dart';
import 'package:fast_delivery/signin.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BoasvindasPage extends StatefulWidget {
  const BoasvindasPage({Key? key}) : super(key: key);

  @override
  _BoasvindasPageState createState() => _BoasvindasPageState();
}

class _BoasvindasPageState extends State<BoasvindasPage> {
  @override
  void initState() {
    super.initState();
    verficarToken().then((value) {
      if (value) {
        Navigator.of(context).pushReplacementNamed('/home');
      } else {
        Navigator.of(context).pushReplacementNamed('/login');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Logotipo(),
            Center(
              child: CircularProgressIndicator(),
            )
          ],
        ),
      ),
    );
  }

  Future<bool> verficarToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    if (sharedPreferences.getString('token') == null) {
      return false;
    } else {
      return true;
    }
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
            height: 250,
          ),
        ],
      ),
    );
  }
}
