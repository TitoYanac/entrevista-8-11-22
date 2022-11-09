import 'dart:async';

import 'package:examen_practico/vistas/vistaC.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
class VistaD extends StatefulWidget {
  const VistaD({Key? key}) : super(key: key);

  @override
  State<VistaD> createState() => _VistaDState();
}

class _VistaDState extends State<VistaD> {

  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    // Crear y almacenar el VideoPlayerController. El VideoPlayerController
    // ofrece distintos constructores diferentes para reproducir videos desde assets, archivos,
    // o internet.
    _controller = VideoPlayerController.asset(
      //'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
      'assets/videos/video1.mp4',
      //'https://drive.google.com/drive/folders/1mwzluzlsc7ZevgJ-eK_n6G1rdP8yP4lD',
    );

    // Inicializa el controlador y almacena el Future para utilizarlo luego
    _initializeVideoPlayerFuture = _controller.initialize();

    // Usa el controlador para hacer un bucle en el vídeo
    _controller.setLooping(true);

    super.initState();
  }

  @override
  void dispose() {
    // Asegúrate de despachar el VideoPlayerController para liberar los recursos
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
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
                        width: size.width * 0.5,
                      ),
                      Positioned(
                        bottom: 0,
                        child: Text(
                          "D",
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

                ],
              ),
            ),
          ),
          //muñeco
          Positioned(
            top: size.width,
            left: -10,
            child: Container(
              width: 180,
              height: 200,
              color: Colors.transparent,
              child: FittedBox(fit: BoxFit.fill,child: Image.asset("assets/images/img1.png")),
            ),
          ),
          //gift
          Positioned(
            top: size.width,
            right: 50,
            child: Container(
              width: 150,
              height: 130,
              color: Colors.transparent,
              child: Image.asset("assets/gifs/giphy.gif"),
            ),
          ),
          //video
          Positioned(
            top: size.width+ 150,
            right: 20,
            child: Container(
              width: 200,
              height: 150,
              color: Colors.transparent,
              child:  FutureBuilder(
                future: _initializeVideoPlayerFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    // Si el VideoPlayerController ha finalizado la inicialización, usa
                    // los datos que proporciona para limitar la relación de aspecto del VideoPlayer
                    return AspectRatio(
                      aspectRatio: _controller.value.aspectRatio,
                      // Usa el Widget VideoPlayer para mostrar el vídeo
                      child: VideoPlayer(_controller),
                    );
                  } else {
                    // Si el VideoPlayerController todavía se está inicializando, muestra un
                    // spinner de carga
                    return Center(child: CircularProgressIndicator());
                  }
                },
              ),
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
                      MaterialPageRoute(builder: (context) => const VistaC()),
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Envuelve la reproducción o pausa en una llamada a `setState`. Esto asegura
          // que se muestra el icono correcto
          setState(() {
            // Si el vídeo se está reproduciendo, pausalo.
            if (_controller.value.isPlaying) {
              _controller.pause();
            } else {
              // Si el vídeo está pausado, reprodúcelo
              _controller.play();
            }
          });
        },
        // Muestra el icono correcto dependiendo del estado del vídeo.
        child: Icon(
          _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
        ),
      ),
    );
  }
}
