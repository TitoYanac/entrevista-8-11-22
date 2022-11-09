import 'package:examen_practico/vistas/video.dart';
import 'package:examen_practico/vistas/vistaB.dart';
import 'package:examen_practico/vistas/vistaC.dart';
import 'package:examen_practico/vistas/vistaD.dart';
import 'package:flutter/material.dart';

class VistaC extends StatefulWidget {
  const VistaC({Key? key}) : super(key: key);

  @override
  State<VistaC> createState() => _VistaCState();
}

class _VistaCState extends State<VistaC> {
  int _suma = 0;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    TextEditingController _numero1 = TextEditingController();
    TextEditingController _numero2 = TextEditingController();

    @override
    void dispose() {
      _numero1.dispose();
      _numero2.dispose();
      super.dispose();
    }

    return Scaffold(
      body: GestureDetector(
        onTap: (){
          final FocusScopeNode focus = FocusScope.of(context);
          if(!focus.hasPrimaryFocus && focus.hasFocus){
            FocusManager.instance.primaryFocus?.unfocus();
          }
        },
        child: Stack(
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
                          width: size.width * 0.5,
                        ),
                        Positioned(
                          bottom: 0,
                          child: Text(
                            "C",
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
                    const SizedBox(
                      height: 40,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 100,
                            color: Colors.white,
                            padding: const EdgeInsets.symmetric(horizontal: 8),

                            child: TextField(
                              controller: _numero1,
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                hintText: "0",
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _suma = int.parse(_numero1.text == ""
                                        ? "0"
                                        : _numero1.text) +
                                    int.parse(_numero2.text == ""
                                        ? "0"
                                        : _numero2.text);
                                print(_suma);
                              });
                            },
                            child: Container(
                              color: Colors.transparent,
                              child: const Icon(
                                Icons.add,
                                size: 100,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Container(
                            width: 100,
                            color: Colors.white,
                            padding: EdgeInsets.symmetric(horizontal: 8),
                            child: TextField(
                              controller: _numero2,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                hintText: "0",
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            color: Colors.transparent,
                            child: const Text(
                              "Resultado:",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 40,
                              ),
                            ),
                          ),
                          Container(
                            width: 100,
                            height: 40,
                            color: Colors.white,
                            child: Center(child: Text("$_suma")),
                          ),
                        ],
                      ),
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
                        MaterialPageRoute(builder: (context) => const VistaD()),
                        //FocusScope.of(context).unfocus();
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
                        MaterialPageRoute(builder: (context) => const VistaB()),
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
      ),
    );
  }
}
