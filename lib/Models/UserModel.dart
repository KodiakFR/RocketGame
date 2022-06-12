class UserModel {
  final String? email;
  final String? password;
  final String? pseudo;
  final bool? genre;
  String? uid;
  

  UserModel({
    this.uid,
    this.email,
    this.password,
    this.pseudo,
    this.genre,
  });


/**
 * Setter Uid
 */
  set setUid(value) => uid = value;

  Map<String, dynamic> toJson() => {
        'uid': uid,
        'email': email,
        'password': password,
        'pseudo' : pseudo,
        'genre' : genre,
      };
}
