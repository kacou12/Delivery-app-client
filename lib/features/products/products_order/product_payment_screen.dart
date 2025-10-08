import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:woudy_customers_app/core/services/router/page_routes.enum.dart';

class ProductPaymentScreen extends StatelessWidget {
  const ProductPaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Paiement')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Total à payer : \$199.99',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 50),
            ElevatedButton(
              onPressed: () {
                // Simuler une validation de paiement
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => const OrderConfirmationScreen(),
                //   ),
                // );

                context.pushNamed(PageRoutes.productOrderConfirmation.name);
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 15),
              ),
              child: const Text(
                'Payer maintenant',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
