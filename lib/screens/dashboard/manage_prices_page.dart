import 'package:flutter/material.dart';

class ManagePricesPage extends StatelessWidget {
  const ManagePricesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController priceController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Manage Water Unit Prices'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: priceController,
              decoration: const InputDecoration(
                labelText: 'Enter New Price per Unit',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Logic to update price in Firebase
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Price Updated')),
                );
              },
              child: const Text('Update Price'),
            ),
          ],
        ),
      ),
    );
  }
}
