class UserEntity {
  final String uid;
  final String name;
  final String email;
  final String password;
  final String profileUrl;
  final double depositsTotalValue;

  UserEntity({
    this.uid = "",
    this.name = "",
    this.email = "",
    this.password = "",
    this.profileUrl = "",
    this.depositsTotalValue = 0,
  });

  Map<String, dynamic> toDocument() {
    return {
      "uid": uid,
      "name": name,
      "email": email,
      "profileUrl": profileUrl,
      "depositsTotalValue": depositsTotalValue,
    };
  }
}
