import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;

import '../constants.dart';


class PDFScreen extends StatefulWidget {
  final String pdfUrl;

  const PDFScreen({Key? key, required this.pdfUrl}) : super(key: key);

  @override
  _PDFScreenState createState() => _PDFScreenState();
}

class _PDFScreenState extends State<PDFScreen> {
  String? pdfPath;

  @override
  void initState() {
    super.initState();
    downloadAndDisplayPDF(widget.pdfUrl);
  }


  Future<void> downloadAndDisplayPDF(pdfUrl) async {
    // The URL of the PDF you want to download.
    final pdfUrl = 'https://openaccess.uoc.edu/bitstream/10609/138287/6/epellicer0TFM1221memoria.pdf';

    // Fetch the PDF from the URL.
    final pdfResponse = await http.get(Uri.parse(pdfUrl));

    // Check the response status code. If it's not `200` (OK), throw an error.
    if (pdfResponse.statusCode != 200) {
      throw Exception('Failed to download PDF');
    }

    // Get the temporary directory.
    Directory tempDir = await getTemporaryDirectory();

    // Create a file to store the PDF.
    final pdfFile = File('${tempDir.path}/my-pdf.pdf');

    // Write the PDF data to the file.
    await pdfFile.writeAsBytes(pdfResponse.bodyBytes);

    setState(() {
      pdfPath = pdfFile.path;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PDF Viewer'),
        backgroundColor: appColor, 
      ),
      body: pdfPath != null
          ? PDFView(
              filePath: pdfPath!,
            )
          : const Center(
              child: CircularProgressIndicator(),
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
