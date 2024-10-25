import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_auth/models/UserModel.dart';
import 'package:flutter_auth/screens/home/home.dart';
import 'package:flutter_auth/screens/authentication/authenticate.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserModel?>(context);

    // Redirect based on the authentication state
    if (user == null) {
      return const Authenticate();
    } else {
      return const Home();
    }
  }
}
