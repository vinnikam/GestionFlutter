import 'package:aplicacionautenticar/modelos/usuario.dart';
import 'package:aplicacionautenticar/otrapantalla.dart';
import 'package:aplicacionautenticar/widgets/textfieldgeneral.dart';
import 'package:aplicacionautenticar/widgets/utilapi/ConsumidorApi.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Autenticacion extends StatelessWidget {
  final ServiciosApi serviciosApi = ServiciosApi();
  late final Propietario? propietario;

  Autenticacion({this.propietario});

  @override
  Widget build(BuildContext context) {
    final TextEditingController _controllerUsuario = TextEditingController();
    final TextEditingController _controllerClave = TextEditingController();

    autenticar() async {
      print('Invocar el metodo API de autenticacion');
      print(_controllerUsuario.text);
      print(_controllerClave.text);
      final propietario = await this
          .serviciosApi
          .autenticarUsuario(_controllerUsuario.text, _controllerClave.text);

      if (propietario != null) {
        print('Propietario encontrado: ${propietario.nombreCompleto}');
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => OtraPantalla(propietario: propietario)),
        );
      } else {
        print('No se encontró el propietario.');
      }
    }

    // TODO: implement build
    return SafeArea(
        child: Scaffold(
            backgroundColor: Color.fromARGB(255, 224, 212, 212),
            body: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                  Text(
                    "LAPLICA ION",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("Iniciar sesión",
                          style: TextStyle(
                              color: Color(0xff720404),
                              fontSize: 20,
                              fontWeight: FontWeight.bold)),
                      Text("Registrarse",
                          style: TextStyle(
                              color: Color(0xff720404),
                              fontSize: 20,
                              fontWeight: FontWeight.bold))
                    ],
                  ),
                  SizedBox(
                    height: 25.0,
                  ),
                  _textFieldUsuario(_controllerUsuario),
                  SizedBox(
                    height: 25.0,
                  ),
                  _textFieldClave(_controllerClave),
                  SizedBox(
                    height: 25.0,
                  ),
                  _raiseButton(autenticar)
                ]))));
  }
}

Widget _textFieldUsuario(TextEditingController _controller) {
  return TextFieldGeneral(
      labelCaja: "Nombre de usuario",
      hintText: "Escriba aca el nombre del usuario ",
      onChanged: (value) {},
      icon: Icons.person_outline,
      controller: _controller);
}

Widget _textFieldClave(TextEditingController _controller) {
  return TextFieldGeneral(
      labelCaja: "Contraseña",
      onChanged: (value) {},
      icon: Icons.lock_outline_rounded,
      obscureText: true,
      controller: _controller);
}

Widget _raiseButton(VoidCallback onPressed) {
  return OutlinedButton(
      onPressed: onPressed,
      child: const Text("Ingresar"),
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: Colors.blue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(7), // Esquinas redondeadas
        ),
        padding: EdgeInsets.symmetric(
            horizontal: 24, vertical: 12), // Color del texto del botón
      ));
}
