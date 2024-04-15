import 'package:flutter/material.dart';

import '../constants.dart';
import '../model/documents.dart';

class DetailScreen extends StatelessWidget {
  final Documents document;

  const DetailScreen({Key? key, required this.document}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(document.name),
          backgroundColor: appColor,
        ),
        body: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Name: ${document.name}', style: fromTextStyle),
              const SizedBox(height: 10.0),
              const Divider(color: primaryColor),
              const SizedBox(height: 10.0),
              Text(document.subject, style: subjectTextStyle),
              const SizedBox(height: 5.0),
              Text(document.date.toString().substring(0, 16), style: dateTextStyle),
              const SizedBox(height: 10.0),
              const Divider(color: primaryColor),
              const SizedBox(height: 10.0),
              Text(document.details, style: bodyTextStyle),
            ],
          ),
        ),
        bottomNavigationBar: Container(
        color: appColor, // Color de fondo del footer
        padding: const EdgeInsets.all(10.0), // Espaciado interno del footer
        child: const Column(
          mainAxisSize: MainAxisSize.min, // Ajusta el tamaño de la columna según su contenido
          children: <Widget>[
            Text('Adriana Cedeño'),
            Text('Aprendiendo Flutter 2024'),
          ],
        ),
      ),
        );
  }
}