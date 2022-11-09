import 'package:examen_practico/vistas/vistaA.dart';
import 'package:examen_practico/vistas/vistaC.dart';
import 'package:flutter/material.dart';

class VistaB extends StatefulWidget {
  const VistaB({Key? key}) : super(key: key);

  @override
  State<VistaB> createState() => _VistaBState();
}

class _VistaBState extends State<VistaB> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    late TextEditingController _numero1 = TextEditingController();
    late TextEditingController _numero2 = TextEditingController();

    return Scaffold(
      body: Stack(
        children: [
          //background
          Positioned(
            top: 0,
            left: 0,
            child: Container(
              width: size.width,
              height: size.height,
              decoration:
                  const BoxDecoration(color: Color.fromRGBO(76, 57, 113, 1)),
              child: const Text(""),
            ),
          ),
          //appbar
          Positioned(
            top: 0,
            left: 0,
            child: Container(
              width: size.width,
              height: 110,
              color: Color.fromRGBO(95, 139, 247, 1),
            ),
          ),
          //contenido
          Positioned(
            top: 80,
            child: Container(
              width: size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      Container(
                        height: size.width * 0.7,
                        width: size.width*0.5,
                      ),
                      Positioned(
                        bottom: 0,
                        child: Text(
                          "B",
                          style: TextStyle(
                            height: 0.01,
                            fontSize: size.width * 0.78,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 40,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 100,
                        color: Colors.white,
                        child: TextField(
                          controller: _numero1,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.white, width: 6.0),
                            ),
                            filled: true,
                            fillColor: Color.fromRGBO(233, 233, 233, 1),
                            hintText: 'Numero 1',
                            hintStyle: TextStyle(
                                color: Color.fromRGBO(153, 153, 153, 1)),
                            labelStyle: TextStyle(
                                color: Color.fromRGBO(153, 153, 153, 1)),
                          ),
                        ),
                      ),
                      Container(
                        child: Icon(
                          Icons.add,
                          size: 100,
                          color: Colors.white,
                        ),
                      ),
                      Container(
                        width: 100,
                        color: Colors.white,
                        child: TextField(
                          controller: _numero2,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.white, width: 6.0),
                            ),
                            filled: true,
                            fillColor: Color.fromRGBO(233, 233, 233, 1),
                            hintText: 'Numero 2',
                            hintStyle: TextStyle(
                                color: Color.fromRGBO(153, 153, 153, 1)),
                            labelStyle: TextStyle(
                                color: Color.fromRGBO(153, 153, 153, 1)),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          // boton continuar
          Positioned(
            width: size.width,
            top: size.height - (size.width * 0.25 + 110),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const VistaC()),
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
          //botton navigation bar
          Positioned(
            top: size.height - 110,
            left: -180,
            child: Container(
              width: size.width + 180,
              padding: EdgeInsets.only(left: 90, right: 90),
              height: 110,
              color: Color.fromRGBO(95, 139, 247, 1),
              child: FittedBox(
                fit: BoxFit.fill,
                alignment: Alignment.topRight,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const VistaA()),
                    );
                  },
                  child: new Icon(
                    Icons.arrow_left,
                    color: Colors.white,
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
