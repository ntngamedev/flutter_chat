class User {
  final String id;
  final String name;
  final String avatarURL;
  final UserType type;

  User(this.id, this.name, this.avatarURL, this.type);
}

enum UserType { none, facebook, google }
