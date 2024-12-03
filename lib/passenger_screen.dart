import 'package:flutter/material.dart';
import 'initial_screen.dart';
import 'slots_screen.dart';
import 'menu_popup.dart';

class PassengerScreen extends StatefulWidget {
  const PassengerScreen({Key? key}) : super(key: key);

  @override
  _PassengerScreenState createState() => _PassengerScreenState();
}

class _PassengerScreenState extends State<PassengerScreen> {
  final List<Map<String, String>> fromUisRoutes = [
    {
      'conductor': 'Daniel',
      'ruta': 'UIS - Cra 27 - Girón',
      'precio': '3,000',
      'hora': '4:00pm',
      'rating': '5',
    },
    {
      'conductor': 'Pablo',
      'ruta': 'UIS - Cra 33 - Girón',
      'precio': '3,500',
      'hora': '6:00pm',
      'rating': '4.7',
    },
  ];

  final List<Map<String, String>> toUisRoutes = [
    {
      'conductor': 'Ana',
      'ruta': 'Cabecera - Cra 36 - UIS',
      'precio': '3,200',
      'hora': '7:30am',
      'rating': '4.9',
    },
    {
      'conductor': 'Carlos',
      'ruta': 'Floridablanca - UIS',
      'precio': '3,500',
      'hora': '8:00am',
      'rating': '5',
    },
  ];

  List<Map<String, String>> displayedRoutes = [];
  bool isFromUis = true;

  @override
  void initState() {
    super.initState();
    displayedRoutes = fromUisRoutes;
  }

  void _toggleRoutes(bool fromUis) {
    setState(() {
      isFromUis = fromUis;
      displayedRoutes = fromUis ? fromUisRoutes : toUisRoutes;
    });
  }

  void _logout() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => InitialScreen()),
    );
  }

  void _navigateToSlotsScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SlotsScreen()),
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
                'Rutas disponibles',
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  onPressed: () => _toggleRoutes(false),
                  icon: Icon(Icons.map, size: 30),
                  label: Text('Hacia la UIS'),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    backgroundColor: isFromUis ? Colors.green : Colors.green.shade300,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                SizedBox(width: 20),
                ElevatedButton.icon(
                  onPressed: () => _toggleRoutes(true),
                  icon: Icon(Icons.map, size: 30),
                  label: Text('Desde la UIS'),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    backgroundColor: isFromUis ? Colors.green.shade300 : Colors.green,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            ListView.builder(
              shrinkWrap: true,
              itemCount: displayedRoutes.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 16.0),
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
                                children: [
                                  Text(
                                    'Conductor: ${displayedRoutes[index]['conductor']} ${displayedRoutes[index]['rating']}★',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 8),
                              Text(
                                'Ruta: ${displayedRoutes[index]['ruta']}',
                                style: TextStyle(fontSize: 18),
                              ),
                              SizedBox(height: 8),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('\$${displayedRoutes[index]['precio']}', style: TextStyle(fontSize: 18)),
                                  Row(
                                    children: [
                                      Icon(Icons.access_time, size: 24),
                                      SizedBox(width: 5),
                                      Text(
                                        '${displayedRoutes[index]['hora']}',
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
                );
              },
            ),
            SizedBox(height: 60),
            Center(
              child: Column(
                children: [
                  Text(
                    '¿No te sirven?',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('Ofrece una ruta'),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 50, vertical: 12),
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white,
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
            _navigateToSlotsScreen();
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
