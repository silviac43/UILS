import 'package:flutter/material.dart';
import 'passenger_screen.dart';
import 'driver_screen.dart';
import 'initial_screen.dart';
import 'bus_screen.dart';

void showMenuPopup(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Container(
          padding: const EdgeInsets.all(16.0),
          height: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'Entrar como:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildMenuOption(
                    icon: Icons.person,
                    label: 'Pasajero',
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => PassengerScreen()),
                      );
                    },
                  ),
                  _buildMenuOption(
                    icon: Icons.directions_car,
                    label: 'Conductor',
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => DriverScreen()),
                      );
                    },
                  ),
                ],
              ),
              Divider(),
              _buildMenuOption(
                icon: Icons.directions_bus,
                label: 'Bus',
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => BusScreen()),
                  );
                },
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => InitialScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 50),
                ),
                child: Text(
                  'Cerrar sesión',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}

Widget _buildMenuOption(
    {required IconData icon, required String label, required VoidCallback onPressed}) {
  return Column(
    children: [
      IconButton(
        icon: Icon(icon, size: 40, color: Colors.green),
        onPressed: onPressed,
      ),
      Text(label, style: TextStyle(fontSize: 16)),
    ],
  );
}
