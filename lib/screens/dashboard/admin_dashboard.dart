import 'package:flutter/material.dart';
import 'view_complaints_page.dart';
import 'generate_bills_page.dart';
import 'manage_officers_page.dart';
import 'manage_prices_page.dart';
import 'add_customers_page.dart';

class AdminDashboard extends StatelessWidget {
  const AdminDashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Dashboard'),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          children: [
            _dashboardTile(context, 'View Complaints', Icons.report, const ViewComplaintsPage()),
            _dashboardTile(context, 'Generate Bills', Icons.receipt, const GenerateBillsPage()),
            _dashboardTile(context, 'Manage Officers', Icons.group, const ManageOfficersPage()),
            _dashboardTile(context, 'Manage Prices', Icons.attach_money, const ManagePricesPage()),
            _dashboardTile(context, 'Add Customers', Icons.person_add, const AddCustomersPage()),
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
