// login_screen.dart

import 'package:flutter/material.dart';
import '../constants.dart';
import 'list_documents_screen.dart';
import 'register_screen.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'login_screen';
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

 class _LoginScreenState extends State<LoginScreen> {
  late String username;
  late String password;

  void _login() {
    // Validar credenciales
    bool isValid = validateCredentials(username, password);
    if (isValid) {
      // Credenciales válidas, navegar a la pantalla de documentos
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const ListScreen(title: 'Developer Documents'),
        ),
      );
    } else {
      // Mostrar mensaje de error
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Login Failed'),
            content: const Text('Invalid username or password. Please try again.'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Documents'),
        backgroundColor: appColor,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextField(
              textAlign: TextAlign.center,
              enableSuggestions: false,
              autocorrect: false,
              keyboardType: TextInputType.name,
              onChanged: (value) {
                username = value;
              },
              decoration: textFieldDecoration.copyWith(hintText: 'Enter your username'),
            ),
            const SizedBox(
              height: 16.0,
            ),
            TextField(
              textAlign: TextAlign.center,
              obscureText: true,
              enableSuggestions: false,
              autocorrect: false,
              onChanged: (value) {
                password = value;
              },
              decoration: textFieldDecoration.copyWith(hintText: 'Enter your password'),
            ),
            const SizedBox(
              height: 64.0,
            ),
            TextButton(
              onPressed: _login,
              child: const Text(
                'Log in',
                style: TextStyle(color: Colors.white, fontSize: 16.0),
              ),
              style: ButtonStyle(
                minimumSize: MaterialStateProperty.all<Size>(const Size(200.0, 50.0)),
                backgroundColor: MaterialStateProperty.all<Color>(teriaryColor),
              ),
            ),
            const SizedBox(
              height: 16.0,
            ),
            TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const RegisterScreen();
                }));
              },
              child: const Text(
                'Register',
                style: TextStyle(color: Colors.white, fontSize: 16.0),
              ),
              style: ButtonStyle(
                minimumSize: MaterialStateProperty.all<Size>(const Size(200.0, 50.0)),
                backgroundColor: MaterialStateProperty.all<Color>(primaryColor),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        color: appColor,
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text('Adriana Cedeño'),
            Text('Aprendiendo Flutter 2024'),
          ],
        ),
      ),
    );
  }
  
  bool validateCredentials(String username, String password) {
  // Implement your logic here to validate the credentials
  // For example:
  if (username == "adrianac" && password == "lavidaesbella") {
    return true; // Credentials are valid
  } else {
    return false; // Credentials are invalid
  }
}
}

