import 'package:flutter/material.dart';
import 'upload_meter_reading_page.dart';
import 'view_non_registered_customers_page.dart';
import 'change_password_page.dart';

class MeterReaderDashboard extends StatelessWidget {
  const MeterReaderDashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meter Reader Dashboard'),
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          children: [
            _dashboardTile(context, 'Upload Meter Reading', Icons.camera, const UploadMeterReadingPage()),
            _dashboardTile(context, 'View Non-Registered Customers', Icons.visibility, const ViewNonRegisteredCustomersPage()),
            _dashboardTile(context, 'Change Password', Icons.password, const ChangePasswordPage()),
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