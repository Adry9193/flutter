class Login {
  final int id;
  final String name;
  final String password;
   bool log;

  Login( {
    required this.id,
    required this.name,
    required this.password,
    this.log = false,
  });
}
