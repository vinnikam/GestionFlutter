import 'package:aplicacionautenticar/pantallaprincipal.dart';
import 'package:flutter/material.dart';

void main() => runApp(const Aplicacion());

class Aplicacion extends StatelessWidget {
  const Aplicacion({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Aplicacion Autenticacion",
        home: PantallaInicial());
  }
}
