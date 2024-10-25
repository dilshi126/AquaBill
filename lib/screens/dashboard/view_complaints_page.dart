import 'package:flutter/material.dart';

class ViewComplaintsPage extends StatelessWidget {
  const ViewComplaintsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Customer Complaints'),
      ),
      body: ListView.builder(
        itemCount: 10, // Replace with actual number of complaints from Firebase
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Complaint #${index + 1}'),
            subtitle: const Text('Issue description...'),
            trailing: IconButton(
              icon: const Icon(Icons.done),
              onPressed: () {
                // Handle complaint resolution logic here
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Complaint Resolved')),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
