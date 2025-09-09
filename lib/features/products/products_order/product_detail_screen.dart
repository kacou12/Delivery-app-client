import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my/core/services/router/page_routes.enum.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Détails du Produit')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Montre Connectée Z-200',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            //
            const Text(
              'Prix : \$199.99',
              style: TextStyle(fontSize: 22, color: Colors.green),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            const Text(
              'Une montre connectée élégante avec un écran OLED, un suivi de l\'activité physique, et une autonomie de batterie de 7 jours. Compatible avec Android et iOS.',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.justify,
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => const ProductShippingInfoScreen(),
                //   ),
                // );
                context.pushNamed(PageRoutes.productShippingInfo.name);
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 15),
              ),
              child: const Text('Acheter', style: TextStyle(fontSize: 18)),
            ),
          ],
        ),
      ),
    );
  }
}
