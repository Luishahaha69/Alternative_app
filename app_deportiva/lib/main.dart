import 'package:flutter/material.dart';

void main() {
  runApp(const SportsApp());
}

class SportsApp extends StatelessWidget {
  const SportsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sports Store',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
        textTheme: const TextTheme(
          bodyMedium: TextStyle(fontFamily: 'Roboto'),
        ),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  final List<Map<String, String>> categories = const [
    {'name': 'Balones'},
    {'name': 'Zapatillas'},
    {'name': 'Ropa'},
    {'name': 'Accesorios'},
    {'name': 'Fitness'},
  ];

  final List<Map<String, String>> products = const [
    {
      'name': 'Balón de Fútbol Pro',
      'price': '120.000',
      'image': 'https://upload.wikimedia.org/wikipedia/commons/e/ec/Soccer_ball.svg'
    },
    {
      'name': 'Zapatillas Runner X',
      'price': '250.000',
      'image': 'https://cdn-icons-png.flaticon.com/512/679/679922.png'
    },
    {
      'name': 'Camiseta Team',
      'price': '80.000',
      'image': 'https://cdn-icons-png.flaticon.com/512/2965/2965567.png'
    },
    {
      'name': 'Guantes de Gimnasio',
      'price': '60.000',
      'image': 'https://cdn-icons-png.flaticon.com/512/684/684908.png'
    },
    {
      'name': 'Botella Deportiva',
      'price': '25.000',
      'image': 'https://cdn-icons-png.flaticon.com/512/2907/2907245.png'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Encabezado de bienvenida
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text('Bienvenido de nuevo,',
                          style: TextStyle(fontSize: 16, color: Colors.grey)),
                      Text('Atleta 👟',
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: () {},
                  )
                ],
              ),

              const SizedBox(height: 16),

              // Banner promocional
              Container(
                height: 120,
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text('Ofertas de Temporada',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18)),
                          SizedBox(height: 8),
                          Text('Hasta 30% de descuento en artículos selectos',
                              style: TextStyle(fontSize: 12)),
                          SizedBox(height: 8),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 80,
                      height: 80,
                      child: Image.network(
                          'https://cdn-icons-png.flaticon.com/512/833/833314.png',
                          fit: BoxFit.contain),
                    )
                  ],
                ),
              ),

              const SizedBox(height: 18),

              // Categorías
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text('Categorías',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  Text('Ver todas', style: TextStyle(color: Colors.blue))
                ],
              ),
              const SizedBox(height: 8),
              SizedBox(
                height: 44,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: categories
                      .map((c) => _CategoryChip(name: c['name'] ?? ''))
                      .toList(),
                ),
              ),

              const SizedBox(height: 18),

              // Productos nuevos
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text('Nuevos productos',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  Text('Ver todos', style: TextStyle(color: Colors.blue))
                ],
              ),
              const SizedBox(height: 12),
              SizedBox(
                height: 220,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: products
                      .map((p) => _ProductCard(data: p))
                      .toList(),
                ),
              ),
            ],
          ),
        ),
      ),

      // Menú inferior
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.category), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_bag), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
        ],
      ),
    );
  }
}

// Chip de categorías
class _CategoryChip extends StatelessWidget {
  final String name;
  const _CategoryChip({required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
          color: Colors.grey.shade100, borderRadius: BorderRadius.circular(20)),
      child: Text(name),
    );
  }
}

// Tarjeta de productos
class _ProductCard extends StatelessWidget {
  final Map<String, String> data;
  const _ProductCard({required this.data});

  @override
  Widget build(BuildContext context) {
    final img = data['image'] ?? '';
    return Container(
      width: 170,
      margin: const EdgeInsets.only(right: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 110,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.grey[200]),
            clipBehavior: Clip.hardEdge,
            child: Image.network(img,
                fit: BoxFit.cover,
                width: double.infinity,
                errorBuilder: (_, __, ___) => const Icon(Icons.broken_image)),
          ),
          const SizedBox(height: 8),
          Text(data['name'] ?? '',
              style: const TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 4),
          Text('\$${data['price']}',
              style: TextStyle(color: Colors.grey[800])),
          const SizedBox(height: 8),
          SizedBox(
            width: double.infinity,
            child:
                ElevatedButton(onPressed: () {}, child: const Text('Comprar')),
          )
        ],
      ),
    );
  }
}
