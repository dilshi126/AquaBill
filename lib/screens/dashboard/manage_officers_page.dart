import 'package:flutter/material.dart';

class ManageOfficersPage extends StatelessWidget {
  const ManageOfficersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController officerEmailController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Manage Area Officers'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: officerEmailController,
              decoration: const InputDecoration(
                labelText: 'Officer Email',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Logic to add officer (Firebase logic)
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Officer Added')),
                );
              },
              child: const Text('Add Officer'),
            ),
          ],
        ),
      ),
    );
  }
}
