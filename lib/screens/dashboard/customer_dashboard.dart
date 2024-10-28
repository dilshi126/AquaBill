 import 'package:flutter/material.dart';
import 'bills_page.dart';
import 'maintenance_info.dart';
import 'complaints_page.dart';
import 'payment_page.dart';

class CustomerDashboard extends StatelessWidget {
  const CustomerDashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Customer Dashboard'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          children: [
            _dashboardTile(context, 'Scheduled Maintenance', Icons.build, const MaintenanceInfo()),
            _dashboardTile(context, 'View Monthly Bill', Icons.receipt, const BillsPage()),
            _dashboardTile(context, 'Pay Bill', Icons.payment, const PaymentPage()),
            _dashboardTile(context, 'Submit Complaint', Icons.report_problem, const ComplaintsPage()),
          ],
        ),
      ),
    );
  }

  GestureDetector _dashboardTile(BuildContext context, String title, IconData icon, Widget page) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => page),
      ),
      child: Card(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 50),
              const SizedBox(height: 10),
              Text(title, textAlign: TextAlign.center),
            ],
          ),
        ),
      ),
    );
  }
}
