class Documents {
  final int id;
  final String name;
  final String subject;
  final String details;
  final String url;
  final DateTime date;
  bool read;

  Documents({
    required this.id,
    required this.name,
    required this.subject,
    required this.details,
    required this.url,
    required this.date,
    this.read = false,
  });
}
