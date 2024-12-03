import 'package:flutter/material.dart';
import 'menu_popup.dart';
import 'driver_screen.dart';

class RouteScreen extends StatefulWidget {
  const RouteScreen({Key? key}) : super(key: key);

  @override
  _RouteScreenState createState() => _RouteScreenState();
}

class _RouteScreenState extends State<RouteScreen> {

  void _navigateToDriverScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => DriverScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {
              showMenuPopup(context);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Actualmente no tienes ninguna ruta activa',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            SizedBox(height: 20),
            Image.asset(
              'assets/images/carro.png',
              height: 250,
            ),
            SizedBox(height: 60),
            Text(
              '¿Deseas iniciar una ruta?',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _navigateToDriverScreen(context);
              },
              child: Text('Ver historial de rutas'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                foregroundColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        onTap: (int index) {
          if (index == 0) {
            _navigateToDriverScreen(context);
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.history, size: 40, color: Colors.green),
            label: 'Rutas pasadas',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.directions_car, size: 40, color: Colors.green),
            label: 'Ruta activa',
          ),
        ],
      ),
    );
  }
}
