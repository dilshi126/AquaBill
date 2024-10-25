import 'package:flutter/material.dart';

class AddCustomersPage extends StatelessWidget {
  const AddCustomersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController customerNameController = TextEditingController();
    final TextEditingController customerEmailController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Customer'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: customerNameController,
              decoration: const InputDecoration(
                labelText: 'Customer Name',
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: customerEmailController,
              decoration: const InputDecoration(
                labelText: 'Customer Email',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Logic to add customer to Firebase
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Customer Added')),
                );
              },
              child: const Text('Add Customer'),
            ),
          ],
        ),
      ),
    );
  }
}
