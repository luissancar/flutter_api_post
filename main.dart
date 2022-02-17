// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_local_variable, avoid_print

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// en android/app/src/AndroidManifest.xml añadir:
//  <uses-permission android:name="android.permission.INTERNET"/>

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplicación',
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController controladorMarca = TextEditingController();
  TextEditingController controladorModelo = TextEditingController();
  TextEditingController controladorPrecio = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Aplicación"),
      ),
      body: Column(children: [
        Row(
          children: [
            Text("Marca "),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(right: 100.0),
                child: TextField(
                  controller: controladorMarca,
                  autofocus: true,
                  keyboardType: TextInputType.text,
                  maxLength: 50,
                ),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Text("Modelo "),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(right: 100.0),
                child: TextField(
                  controller: controladorModelo,
                  keyboardType: TextInputType.text,
                  maxLength: 50,
                ),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Text("Precio "),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(right: 200.0),
                child: TextField(
                  controller: controladorPrecio,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.right,
                  maxLength: 5,
                ),
              ),
            ),
          ],
        ),
        ElevatedButton(
          child: Text("Enviar"),
          onPressed: () {
            var marca = controladorMarca.text;
            var modelo = controladorModelo.text;
            var precio = controladorPrecio.text;
            grabar(
                "http://iesayala.ddns.net/json/insertguitar.php?marca=$marca&modelo=$modelo&precio=$precio");
          },
        ),
      ]),
    );
  }
}

Future<void> grabar(String url) async {
  try {
    print(url);
    final llamada = await http.post(Uri.parse(url));
    print("ok");
  } catch (e) {
    print(e.toString());
  }
}
