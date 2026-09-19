class UserModel {
  final String email;

  UserModel({required this.email});

  String get name => email.split('@')[0][0].toUpperCase() +
      email.split('@')[0].substring(1);

  String get initial => email[0].toUpperCase();
}