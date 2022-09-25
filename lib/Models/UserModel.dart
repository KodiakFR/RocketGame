class UserModel {
  String? email;
  String? password;
  String? uid;
  

  UserModel({
    this.uid,
    this.email,
    this.password,

  });

  UserModel.empty();

  UserModel copyWith({String? uid, String? email, String? password}){
    return UserModel(
      uid: uid ?? this.uid,
      email: email ?? this.email,
      password: password ?? this.password
    );
  }

/**
 * Setter Uid
 */
  set setUid(value) => uid = value;

  Map<String, dynamic> toJson() => {
        'uid': uid,
        'email': email,
        'password': password,
      };
}
