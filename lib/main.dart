import 'package:alpha/welcome.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';

void main() {
  runApp(const MaterialApp(home: Home()));
}

bool isEmail(String input) => EmailValidator.validate(input);
bool isPhone(String input) =>
    RegExp(r'^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$')
        .hasMatch(input);

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _phone = TextEditingController();
  final formKey = GlobalKey<FormState>();
  void validate() {
    formKey.currentState!.validate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: _email,
                decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(),
                    labelText: 'enter the email'),
                validator: (value) {
                  if (!isEmail(value!)) {
                    return 'Please enter a valid email ';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: _phone,
                maxLength: 10,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.phone_android),
                    border: OutlineInputBorder(),
                    labelText: 'enter the phone number'),
                validator: (value) {
                  if (!isPhone(value!)) {
                    return 'Please enter a valid email or phone number.';
                  }
                  return null;
                },
              ),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
                onPressed: () {
                  final FormState = formKey.currentState;
                  if (FormState!.validate()) {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => Welcome(
                                email: _email.text, phone: _phone.text))));
                  }
                },
                child: const Text('go to list')),
          ],
        ),
      ),
    );
  }
}
