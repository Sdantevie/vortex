import 'package:meta/meta.dart';

class User {
  final String username;
  final String avatarUrl;
  final String email;
  final String subscription;

  User(
      {@required this.username,
      this.avatarUrl,
      @required this.email,
      this.subscription});
}
