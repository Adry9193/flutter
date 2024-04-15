import 'package:flutter/material.dart';
import '../constants.dart';
import '../model/backend.dart';
import '../model/documents.dart';
import '../widgets/document_widget.dart';
import 'documents_detail_screen.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  // State.
  var documents = Backend().getDocuments();

  void markDocumentAsRead(int id) {
    Backend().markDocumentAsRead(id);
    setState(() {
      documents = Backend().getDocuments();
    });
  }

  void deleteDocument(int id) {
    Backend().deleteDocument(id);
    setState(() {
      documents = Backend().getDocuments();
    });
  }

  void showDetail(Documents document) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return DetailScreen(document: document);
    }));

    Backend().markDocumentAsRead(document.id);
    setState(() {
      documents = Backend().getDocuments();
    });
  }

  //  void showPdf() {
  //   Navigator.push(context, MaterialPageRoute(builder: (context) {
  //     return const PDFScreen(pdfPath: 'assets/flutter.pdf');
  //   }));

  //   // Backend().markDocumentAsRead(document.id);
  //   setState(() {
  //     documents = Backend().getDocuments();
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: appColor
      ),
      body: ListView.builder(
      itemCount: documents.length,
      itemBuilder: (BuildContext context, int index) => DocumentWidget(
        document: documents[index],
        onTap: showDetail,
        onLongPress: markDocumentAsRead,
        onSwipe: deleteDocument,
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

