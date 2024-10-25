import 'package:flutter/material.dart';

class GenerateBillsPage extends StatelessWidget {
  const GenerateBillsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Generate Monthly Bills'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Logic to generate bills and notify customers
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Bills Generated Successfully')),
            );
          },
          child: const Text('Generate Bills'),
        ),
      ),
    );
  }
}
