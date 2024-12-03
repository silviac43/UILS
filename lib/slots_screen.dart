import 'package:flutter/material.dart';
import 'passenger_screen.dart';
import 'menu_popup.dart';

class SlotsScreen extends StatefulWidget {
  const SlotsScreen({Key? key}) : super(key: key);

  @override
  _SlotsScreenState createState() => _SlotsScreenState();
}

class _SlotsScreenState extends State<SlotsScreen> {
  bool showButtons = false;
  final List<Map<String, String>> routes = [
    {
      'conductor': 'Antonio',
      'ruta': 'UIS - Acrópolis - Girón',
      'precio': '3,000',
      'hora': '6:00pm',
      'rating': '3.5',
    },
  ];

  void _navigateToPassengerScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PassengerScreen()),
    );
  }

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
          children: [
            const Text(
              'Mis cupos',
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            const SizedBox(height: 40),
            const Text(
              'Próximos: ',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            const Text(
              'No tienes ningún cupo confirmado 😞',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 40),
            const Text(
              'Por confirmar: ',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            for (int i = 0; i < routes.length; i++)
              GestureDetector(
                onTap: () {
                  setState(() {
                    showButtons = !showButtons;
                  });
                },
                child: Card(
                  margin: const EdgeInsets.symmetric(vertical: 16.0),
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
                          child: const Icon(
                            Icons.person,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Conductor: ${routes[i]['conductor']} ${routes[i]['rating']}★',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 8),
                              Text(
                                'Ruta: ${routes[i]['ruta']}',
                                style: TextStyle(fontSize: 18),
                              ),
                              SizedBox(height: 8),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('\$${routes[i]['precio']}', style: TextStyle(fontSize: 18)),
                                  Row(
                                    children: [
                                      Icon(Icons.access_time, size: 24),
                                      SizedBox(width: 5),
                                      Text(
                                        '${routes[i]['hora']}',
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
              ),
            if (showButtons) ...[
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      _deleteRoute(0);
                      setState(() {
                        showButtons = false;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                    ),
                    child: const Text('Cancelar'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        showButtons = false;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                    ),
                    child: const Text('Confirmar'),
                  ),
                ],
              ),
            ],
            const SizedBox(height: 40),
            Row(
              children: [
                Image.asset(
                  'assets/images/carrito.png',
                  width: 120,
                  height: 120,
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: const Text(
                    '¡Recuerda confirmar 30 mins antes para ser agregado al chat y no perder tu cupo!',
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        onTap: (int index) {
          if (index == 0) {
            _navigateToPassengerScreen(context);
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.location_on, size: 40, color: Colors.green),
            label: 'Rutas',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.car_repair, size: 40, color: Colors.green),
            label: 'Mis cupos',
          ),
        ],
      ),
    );
  }
}
