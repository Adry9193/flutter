import 'package:flutter/material.dart';
import '../constants.dart';
import '../model/login.dart';
import 'list_documents_screen.dart';

class RegisterScreen extends StatefulWidget {
  static const String id = 'register_screen';
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late String username;
  late String password;
  late String confirmPassword;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register User'),
        backgroundColor: appColor,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextFormField(
                textAlign: TextAlign.center,
                keyboardType: TextInputType.name,
                onChanged: (value) {
                  setState(() {
                    username = value;
                  });
                },
                decoration: textFieldDecoration.copyWith(hintText: 'Enter your username'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a username';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 16.0,
              ),
              TextFormField(
                textAlign: TextAlign.center,
                obscureText: true,
                controller: _passwordController,
                onChanged: (value) {
                  setState(() {
                    password = value;
                  });
                },
                decoration: textFieldDecoration.copyWith(hintText: 'Enter your password'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a password';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 16.0,
              ),
              TextFormField(
                textAlign: TextAlign.center,
                obscureText: true,
                controller: _confirmPasswordController,
                onChanged: (value) {
                  setState(() {
                    confirmPassword = value;
                  });
                },
                decoration: textFieldDecoration.copyWith(hintText: 'Enter your password again'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the password again';
                  } else if (value != _passwordController.text) {
                    return 'Passwords do not match';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 64.0,
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Form is valid, proceed with registration
                    // Implement your registration logic here
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const ListScreen(title: 'Developer Documents')),
                    );
                  }
                },
                child: const Text(
                  'Register',
                  style: TextStyle(color: Colors.white, fontSize: 16.0),
                ),
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(200.0, 50.0), backgroundColor: teriaryColor,
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        color: appColor,
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: const <Widget>[
            Text('Adriana Cedeño'),
            Text('Aprendiendo Flutter 2024'),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    // Clean up controllers
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }
}

// import 'package:flutter/material.dart';

// import '../constants.dart';
// import '../model/login.dart';
// import 'list_documents_screen.dart';

// class RegisterScreen extends StatefulWidget {
//   static const String id = 'login_screen';
//   const RegisterScreen({Key? key}) : super(key: key);

//   @override
//   _RegisterScreenState createState() => _RegisterScreenState();
// }

// class _RegisterScreenState extends State<RegisterScreen> {
//   late String username;
//   late String password;

//   @override
//   Widget build(BuildContext context) {
//    return Scaffold(
//       appBar: AppBar(
//         title: const Text('Register User'),
//         backgroundColor: appColor
//       ),
//       backgroundColor: Colors.white,
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 24.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: <Widget>[
//             TextField(
//               textAlign: TextAlign.center,
//               enableSuggestions: false,
//               autocorrect: false,
//               keyboardType: TextInputType.name,
//               onChanged: (value) {
//                 username = value;
//               },
//               decoration:
//                   textFieldDecoration.copyWith(hintText: 'Enter your username'),
//             ),
//             const SizedBox(
//               height: 16.0,
//             ),
//             TextField(
//               textAlign: TextAlign.center,
//               obscureText: true,
//               enableSuggestions: false,
//               autocorrect: false,
//               onChanged: (value) {
//                 password = value;
//               },
//               decoration:
//                   textFieldDecoration.copyWith(hintText: 'Enter your password'),
//             ),
//             const SizedBox(
//               height: 16.0,
//             ),
//             TextField(
//               textAlign: TextAlign.center,
//               obscureText: true,
//               enableSuggestions: false,
//               autocorrect: false,
//               onChanged: (value) {
//                 password = value;
//               },
//               decoration:
//                   textFieldDecoration.copyWith(hintText: 'Enter your password again'),
//             ),
//             const SizedBox(
//               height: 64.0,
//             ),
//             TextButton(
//               onPressed: () {
//                 Navigator.push(context, MaterialPageRoute(builder: (context) {
//                   return const ListScreen(title: 'Developer Documents',);
//                 }));
//               },
//               child: const Text(
//                 'Register',
//                 style: const TextStyle(color: Colors.white, fontSize: 16.0),
//               ),
//               style: ButtonStyle(
//                 minimumSize:
//                     MaterialStateProperty.all<Size>(const Size(200.0, 50.0)),
//                 backgroundColor: MaterialStateProperty.all<Color>(teriaryColor),
//               ),
//             ),
//           ],
//         ),
//       ),
//       bottomNavigationBar: Container(
//         color: appColor, // Color de fondo del footer
//         padding: const EdgeInsets.all(10.0), // Espaciado interno del footer
//         child: const Column(
//           mainAxisSize: MainAxisSize.min, // Ajusta el tamaño de la columna según su contenido
//           children: <Widget>[
//             Text('Adriana Cedeño'),
//             Text('Aprendiendo Flutter 2024'),
//           ],
//         ),
//       ),
//     );
//   }
// }