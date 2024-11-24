import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: InitialScreen(),
    );
  }
}

class InitialScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 40.0),
            child: Column(
              children: [

                SizedBox(height: 15),

                // Logo UIS
                Image.asset(
                  'assets/images/logo.png',
                  width: 100,
                  height: 100,
                ),
                SizedBox(height: 2),
                Text(
                  'UILS',
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(6, 135, 4, 1),
                  ),
                ),
                Text(
                  '¡On the road!',
                  style: TextStyle(
                    fontSize: 18,
                    color: Color.fromRGBO(94, 174, 92, 1),
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 60),

          // Clima y temperatura
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.cloud,
                color: Color.fromRGBO(184, 184, 184, 1),
                size: 40,
              ),
              SizedBox(width: 12),
              Text(
                '29 °C',
                style: TextStyle(
                  fontSize: 20,
                  color: Color.fromRGBO(113, 113, 113, 1),
                ),
              ),
            ],
          ),
          // Información del Bus UIS
          SizedBox(height: 70),

          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Color.fromRGBO(197, 240, 214, 1),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              children: [
                Text(
                  'Bus UIS',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 5),
                Image.asset(
                  'assets/images/bus.png',
                  width: 200,
                  height: 50,
                ),
                SizedBox(height: 10),
                
                Text(
                  'Lunes a Viernes',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    color: Color.fromRGBO(59, 59, 59, 1),
                  ),
                ),
                Text(
                  'Pasa cada 30 minutos',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(59, 59, 59, 1),
                  ),
                ),
                Text(
                  '8:00 a.m. - 8:00 p.m.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    color: Color.fromRGBO(59, 59, 59, 1),
                  ),
                ),
              ],
            ),
          ),
          // Colectivo
          GestureDetector(
            onTap: () {
              // Navegación a la pantalla de Tutorial
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TutorialScreen()),
              );
            },
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: 300, // Ajuste del alto del fondo
                  child: Image.asset(
                    'assets/images/background.png',
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
                Positioned(
                  bottom: 50,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 70, vertical: 12),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 26, 109, 51),
                      border: Border.all(color: Colors.white, width: 1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      'Colectivo',
                      style: TextStyle(
                        color: const Color.fromARGB(255, 255, 255, 255),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
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

// Nueva pantalla para el tutorial
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
      _onSkip(); // Ir al LoginScreen al finalizar
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
                        color:
                        _currentPage > 0 ? Colors.green : Colors.grey[400],
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

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextButton.icon(
                onPressed: () {
                  // Navegar al menú de inicio si es necesario
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back, color: Colors.black),
                label: Text(
                  "Volver al menú de inicio",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                  ),
                ),
              ),
              SizedBox(height: 60),
              Center(
                child: Text(
                  "Iniciar sesión",
                  style: TextStyle(
                    fontSize: 40,
                    color: const Color.fromARGB(255, 68, 156, 100),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                        "¿Primera vez? ",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                    ),
                    TextButton(
                      onPressed: () {
                        // Navegar a la página de registro
                      },
                      child: Text(
                        "Regístrate",
                        style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: Container(
                  padding: EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.green.shade50,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    children: [

                      Align(
                        alignment: Alignment.centerLeft,
                        child: TextButton(
                          onPressed: () {
                            // Navegar a la página de "Olvidé mi contraseña"
                          },
                          child: Text(
                            "Ingrese sus datos",
                            style: TextStyle(
                              color: const Color.fromARGB(255, 0, 0, 0),
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),

                      SizedBox(height: 10),
                      TextField(
                        decoration: InputDecoration(
                          labelText: "Email",
                          prefixIcon: Icon(Icons.mail, color: Colors.black),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                      SizedBox(height: 40),
                      TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: "Contraseña",
                          prefixIcon: Icon(Icons.lock, color: Colors.black),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Align(
                        alignment: Alignment.center,
                        child: TextButton(
                          onPressed: () {
                            // Navegar a la página de "Olvidé mi contraseña"
                          },
                          child: Text(
                            "Olvidé mi contraseña",
                            style: TextStyle(
                              color: Colors.green,
                              fontSize: 18,
                              ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 60),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Acción al pulsar "Ingresar"
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 65, vertical: 16),
                  ),
                  child: Text(
                    "Ingresar",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              ),
              SizedBox(height: 50),
              Center(
                child: IconButton(
                  onPressed: () {
                    // Implementar inicio de sesión con huella dactilar
                  },
                  icon: Icon(
                    Icons.fingerprint,
                    size: 50,
                    color: Colors.green,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}