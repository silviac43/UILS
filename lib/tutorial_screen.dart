import 'package:flutter/material.dart';
import 'login_screen.dart';

class TutorialScreen extends StatefulWidget {
  @override
  _TutorialScreenState createState() => _TutorialScreenState();
}

class _TutorialScreenState extends State<TutorialScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Map<String, String>> tutorialData = [
    {
      "image": "assets/images/tuto1.png",
      "title": "Como pasajero..",
      "description":
      "• Encontrarás las rutas ofrecidas \n por conductores.\n"
          "• Puedes sugerir la creación de \n una ruta.\n"
          "• Una vez reserves un cupo, \n recuerda confirmar antes del \n viaje.",
    },
    {
      "image": "assets/images/tuto2.png",
      "title": "Como conductor..",
      "description":
      "• Crea tu ruta con los puntos \n clave, precio y hora de salida.\n"
          "• Recibe notificaciones de \n reservas y reasignaciones de \n cupos.\n"
          "• Comunicación directa con chat \n grupal.",
    },
    {
      "image": "assets/images/tuto3.png",
      "title": "Tu opinión es \nimportante",
      "description":
      "Califica a tu conductor o \n pasajeros al finalizar las \n rutas.\n"
          " \n"
          "De este modo te ayudamos a \n escoger el servicio más \n adecuado para ti.",
    },
  ];

  void _onSkip() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
    );
  }

  void _onNext() {
    if (_currentPage < tutorialData.length - 1) {
      _pageController.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      _onSkip();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: SafeArea(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: TextButton(
                onPressed: _onSkip,
                child: Text(
                  "SALTAR",
                  style: TextStyle(
                    fontSize: 17,
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (int index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                itemCount: tutorialData.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 30),
                        Image.asset(
                          tutorialData[index]["image"]!,
                          height: 240,
                        ),
                        SizedBox(height: 30),
                        Text(
                          tutorialData[index]["title"]!,
                          style: TextStyle(
                            fontSize: 30,
                            color: const Color.fromARGB(255, 76, 175, 122),
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 50),
                        Text(
                          tutorialData[index]["description"]!,
                          style: TextStyle(
                            fontSize: 20,
                            color: const Color.fromARGB(137, 0, 0, 0),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: _currentPage > 0
                        ? () => _pageController.previousPage(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    )
                        : null,
                    child: Text(
                      "ATRÁS      ",
                      style: TextStyle(
                        fontSize: 17,
                        color: _currentPage > 0 ? Colors.green : Colors.grey[400],
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Row(
                    children: List.generate(
                      tutorialData.length,
                          (index) => Container(
                        margin: const EdgeInsets.symmetric(horizontal: 4.0),
                        width: 10,
                        height: 10,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _currentPage == index
                              ? Colors.green
                              : Colors.grey[300],
                        ),
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: _onNext,
                    child: Text(
                      _currentPage < tutorialData.length - 1
                          ? "SIGUIENTE"
                          : "COMENZAR",
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
