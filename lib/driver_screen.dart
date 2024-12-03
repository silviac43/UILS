import 'package:flutter/material.dart';
import 'menu_popup.dart';
import 'route_screen.dart';

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

  void _navigateToRouteScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => RouteScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                'Historial de rutas',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
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
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundColor: Colors.green,
                            child: Icon(
                              Icons.person,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(width: 20),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                ),
                                SizedBox(height: 8),
                                Text(
                                  'Ruta: ${routes[index]['ruta']}',
                                  style: TextStyle(fontSize: 18),
                                ),
                                SizedBox(height: 8),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('\$${routes[index]['precio']} COP', style: TextStyle(fontSize: 18)),
                                    Row(
                                      children: [
                                        Icon(Icons.access_time, size: 24),
                                        SizedBox(width: 5),
                                        Text(
                                          '${routes[index]['hora']}',
                                          style: TextStyle(fontSize: 18),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
            SizedBox(height: 60),
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
                      foregroundColor: Colors.white,
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
        onTap: (int index) {
          if (index == 1) {
            _navigateToRouteScreen(context);
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
