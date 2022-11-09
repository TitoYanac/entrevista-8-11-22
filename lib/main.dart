import 'package:examen_practico/vistas/vistaA.dart';
import 'package:examen_practico/vistas/vistaB.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Examen Práctico',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            child: Container(
              width: size.width,
              height: size.height,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/Fondo1.png"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Center(
                heightFactor: 3,
                child: Column(
                  children: [
                    Container(
                        padding: EdgeInsets.all(20),
                        margin: EdgeInsets.only(top: 110),
                        child: Image.asset("assets/images/LogoBlanco.png"),),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            width: size.width,
            bottom: size.width * 0.67,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const VistaA()),
                    );
                  },
                  child: Container(
                    width: size.width * 0.8,
                    height: size.width * 0.25,
                    padding: const EdgeInsets.only(
                      bottom: 20,
                      left: 70,
                      right: 70,
                    ),
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/Rectangulo1.png"),
                        fit: BoxFit.fill,
                      ),
                    ),
                    child: Image.asset(
                      "assets/images/Continuar.png",
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
