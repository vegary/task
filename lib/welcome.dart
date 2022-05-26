import 'package:flutter/material.dart';

class Welcome extends StatelessWidget {
  final String email, phone;

  // const Welcome({Key? key}) : super(key: key);
  const Welcome({Key? key, required this.email, required this.phone})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Text('email: $email'),
          Text('phone: $phone'),
        ],
      ),
    );
  }
}
