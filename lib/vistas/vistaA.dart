import 'package:examen_practico/vistas/vistaB.dart';
import 'package:flutter/material.dart';

import '../main.dart';
class VistaA extends StatefulWidget {
  const VistaA({Key? key}) : super(key: key);

  @override
  State<VistaA> createState() => _VistaAState();
}

class _VistaAState extends State<VistaA> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            child: Container(
              width: size.width,
              height: size.height,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/Fondo2.png"),
                  fit: BoxFit.cover,
                ),
              ),
              child: const Text(""),
            ),
          ),
          Center(
            heightFactor: 1.4,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MyHomePage()),
                );
              },
              child: Text(
                "A",
                style: TextStyle(
                  fontSize: size.width * 0.78,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Positioned(
            width: size.width,
            bottom: size.width * 0.2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const VistaB()),
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
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
