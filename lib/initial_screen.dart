import 'package:flutter/material.dart';
import 'tutorial_screen.dart';

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
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TutorialScreen()),
              );
            },
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: 300,
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
