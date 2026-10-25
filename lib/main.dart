import 'package:flutter/material.dart';

class Dessert {
  const Dessert({
    required this.name,
    required this.description,
    required this.price,
    required this.image,
    required this.icon,
  });

  final String name;
  final String description;
  final String price;
  final String image;
  final IconData icon;
}

const List<Dessert> menu = [
  Dessert(
    name: "Matilda Cake",
    description: 'The big one. Triple-layer, thick fudge icing.',
    price: 'RM 10.00',
    image: 'assets/images/chocolate_cake.jpeg',
    icon: Icons.cake,
  ),
  Dessert(
    name: 'Strawberry Cake',
    description: 'Fluffy sponge, fresh cream, juicy strawberries.',
    price: 'RM 10.00',
    image: 'assets/images/strawberry_cake.jpeg',
    icon: Icons.favorite,
  ),
  Dessert(
    name: 'Fudge Brownie',
    description: 'Dense, gooey and dark chocolate.',
    price: 'RM 8.00',
    image: 'assets/images/brownie.jpeg',
    icon: Icons.star,
  ),
  Dessert(
    name: 'Cupcake',
    description: 'Soft crumb with buttercream swirl.',
    price: 'RM 3.00',
    image: 'assets/images/cupcake.jpeg',
    icon: Icons.bakery_dining,
  ),
  Dessert(
    name: 'Iced Coffee',
    description: 'Cold, smooth and bold. Perfect with cake.',
    price: 'RM 8.00',
    image: 'assets/images/iced_coffee.jpeg',
    icon: Icons.local_cafe,
  ),
];

class MatildaCakeShop extends StatelessWidget {
  const MatildaCakeShop({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.brown.shade50,
        appBar: AppBar(
          backgroundColor: Colors.brown.shade800,
          centerTitle: true,
          title: const Text(
            "Matilda Cake Shop",
            style: TextStyle(color: Colors.white, fontFamily: 'Pacifico'),
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                const MenuBanner(),
                const SizedBox(height: 8),
                for (final dessert in menu) MenuItem(dessert: dessert),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MenuBanner extends StatelessWidget {
  const MenuBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.brown.shade600,
        borderRadius: const BorderRadius.vertical(bottom: Radius.circular(24)),
      ),
      child: const Column(
        children: <Widget>[
          Icon(Icons.cake, size: 48, color: Colors.white),
          SizedBox(height: 8),
          Text(
            'Chocolate cake for everyone',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class MenuItem extends StatelessWidget {
  const MenuItem({super.key, required this.dessert});

  final Dessert dessert;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.brown.shade200,
      elevation: 5,
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                dessert.image,
                height: 70,
                width: 70,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Icon(dessert.icon, size: 50, color: Colors.brown);
                },
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    dessert.name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    dessert.description,
                    style: const TextStyle(fontSize: 13, color: Colors.black54),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            Column(
              children: <Widget>[
                Text(
                  dessert.price,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 6),
                Icon(dessert.icon, color: Colors.brown.shade800),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(const MatildaCakeShop());
}
