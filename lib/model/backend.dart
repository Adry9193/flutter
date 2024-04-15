import 'documents.dart';
import 'login.dart';

class Backend {
  /// Singleton pattern used here.
  static final Backend _backend = Backend._internal();

  factory Backend() {
    return _backend;
  }

  Backend._internal();

  /// Private list of emails. Hardcoded here for testing purposes.
  final _documents = [
    Documents(
      id: 1,
      name: 'Que es Flutter',
      subject: 'Desarrollo de Apps Híbridas',
      details: 'Flutter es un framework de código abierto desarrollado por Google que se utiliza para construir interfaces de usuario multiplataforma de alta calidad y de forma rápida. Con Flutter, puedes crear aplicaciones para dispositivos móviles, web y de escritorio desde un solo código base.',
      url: 'https://openaccess.uoc.edu/bitstream/10609/138287/6/epellicer0TFM1221memoria.pdf',
      date: DateTime(1993, 01, 25, 10, 33)
    ),

    Documents(
      id: 2,
      name: 'Que es Ionic',
      subject: 'Desarrollo de Apps Híbridas',
      details: 'Ionic es un framework de desarrollo de aplicaciones móviles y web de código abierto que se utiliza para crear aplicaciones multiplataforma. Utiliza tecnologías web estándar como HTML, CSS y JavaScript (con TypeScript opcional) para el desarrollo de aplicaciones. Ionic proporciona una amplia gama de componentes UI (User Interface) predefinidos y herramientas para la creación rápida y eficiente de aplicaciones para iOS, Android y la web.',
      url: 'https://iydt.wordpress.com/wp-content/uploads/2021/02/1_06_ionic.pdf',
      date: DateTime(1991, 03, 25, 08, 12)
    ),
    Documents(
      id: 3,
      name: 'Que es Laravel',
      subject: 'Desarrollo Web',
      details: 'Laravel es un framework de desarrollo web de código abierto basado en el lenguaje de programación PHP. Fue creado por Taylor Otwell en 2011 y se ha convertido en uno de los frameworks PHP más populares y ampliamente utilizados en la actualidad. Laravel sigue el patrón de diseño MVC (Modelo-Vista-Controlador) y proporciona una amplia gama de características y herramientas para facilitar el desarrollo web rápido, eficiente y seguro.',
      url: 'https://pressroom.hostalia.com/contents/ui/theme/images/framework-laravel-wp-hostalia.pdf',
      date: DateTime(2016, 02, 25, 11, 43)
    ),

     Documents(
      id: 4,
      name: 'Que es Simfony',
      subject: 'Desarrollo Web',
      details: 'Symfony es un framework de desarrollo web de código abierto escrito en PHP que se utiliza para crear aplicaciones web y API de manera eficiente y estructurada. Fue lanzado por primera vez en 2005 y desde entonces se ha convertido en uno de los frameworks PHP más populares y ampliamente utilizados en la comunidad de desarrollo web. Symfony sigue el patrón de diseño MVC (Modelo-Vista-Controlador) y se basa en componentes reutilizables que facilitan el desarrollo de aplicaciones web robustas y escalables.',
      url: 'https://www.jesusda.com/docs/ebooks/symfony_guia_definitiva.pdf',
      date: DateTime(2019, 02, 28, 19, 50)
    ),
   
  ];

  ///
  /// Public API starts here :)
  ///

  /// Returns all emails.
  List<Documents> getDocuments() {
    return _documents;
  }

  /// Marks email identified by its id as read.
  void markDocumentAsRead(int id) {
    final index = _documents.indexWhere((doc) => doc.id == id);
    _documents[index].read = true;
  }

  /// Deletes email identified by its id.
  void deleteDocument(int id) {
    _documents.removeWhere((doc) => doc.id == id);
  }




}
