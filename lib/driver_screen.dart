import 'package:flutter/material.dart';
import 'passenger_screen.dart';
import 'initial_screen.dart';

class DriverScreen extends StatefulWidget {
  const DriverScreen({Key? key}) : super(key: key);

  @override
  _DriverScreenState createState() => _DriverScreenState();
}

class _DriverScreenState extends State<DriverScreen> {
  final List<Map<String, String>> routes = [
    {
      'ruta': 'UIS - Cra 27 - Girón',
      'precio': '3,000',
      'hora': '8:00am',
    },
    {
      'ruta': 'Centro - UIS',
      'precio': '2,800',
      'hora': '7:15pm',
    },
  ];

  void _deleteRoute(int index) {
    setState(() {
      routes.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return ListView(
                    children: <Widget>[
                      ListTile(
                        title: const Text('Pasajero'),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => PassengerScreen()),
                          );
                        },
                      ),
                      ListTile(
                        title: const Text('Conductor'),
                        onTap: () {},
                      ),
                      ListTile(
                        title: const Text('Cerrar sesión'),
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => InitialScreen()),
                          );
                        },
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                'Historial de rutas',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: Text(
                'Presiona la ruta para activarla',
                style: TextStyle(fontSize: 16),
              ),
            ),
            SizedBox(height: 20),
            ListView.builder(
              shrinkWrap: true,
              itemCount: routes.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onLongPress: () {
                    _deleteRoute(index);
                  },
                  child: Card(
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Ruta: ${routes[index]['ruta']}',
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 5),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('${routes[index]['precio']} COP', style: TextStyle(fontSize: 16)),
                              Row(
                                children: [
                                  Icon(Icons.access_time, size: 20),
                                  SizedBox(width: 5),
                                  Text('${routes[index]['hora']}', style: TextStyle(fontSize: 16)),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
            SizedBox(height: 20),
            Center(
              child: Text(
                'Mantén presionada una ruta para eliminarla',
                style: TextStyle(fontSize: 16),
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('Nueva ruta'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      padding: EdgeInsets.symmetric(horizontal: 50, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        onTap: (int index) {},
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
