import 'package:flutter/material.dart';
import '../constants.dart';
import '../model/documents.dart';
import '../screens/pdf_screen.dart';

class DocumentWidget extends StatelessWidget {
  final Documents document;
  final Function onTap;
  final Function onSwipe;
  final Function onLongPress;

  const DocumentWidget(
      {Key? key,
      required this.document,
      required this.onTap,
      required this.onSwipe,
      required this.onLongPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
        key: Key(document.id.toString()),
        onDismissed: (direction) {
          if (direction == DismissDirection.startToEnd) {
            onSwipe(document.id);
          }
        },
        background: Container(
          color: Colors.red, // Color del fondo al deslizar hacia la derecha
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(15.0),
                child: Icon(Icons.delete),
              ),
            ],
          ),
        ),
        child: GestureDetector(
          // onHorizontalDragEnd: (DragEndDetails details) {
          //   onSwipe(document.id);
          // },
          onLongPress: () {
            onLongPress(document.id);
          },
          onTap: () {
            onTap(document);
          },
          child: Container(
            padding: const EdgeInsets.all(10.0),
            height: 80.0,
            color: document.read
                ? Colors.transparent
                : const Color.fromARGB(110, 238, 189, 189),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    height: 12.0,
                    decoration: BoxDecoration(
                        color:
                        document.read ? Colors.transparent : primaryColor,
                        shape: BoxShape.circle),
                  ),
                ),
                Expanded(
                  flex: 9,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(document.date.toString().substring(0, 10),
                          style: dateTextStyle),
                      Text(document.name, style: fromTextStyle),
                      Text(document.subject, style: subjectTextStyle),
                    ],
                  ),
                ),
                Spacer(), // Añadimos un Spacer para ocupar el espacio entre el Container y el botón
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PDFScreen(pdfUrl: document.url),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        teriaryColor, // Cambia este color al que desees
                  ),
                  child: const Text('PDF'),
                ),
              ],
            ),
          ),
        ));
  }
}
