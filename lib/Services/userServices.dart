import 'package:firebase_auth/firebase_auth.dart';
import 'package:team_rocket_game/Models/UserModel.dart';

class UserServices {
  FirebaseAuth _auth = FirebaseAuth.instance;

  Stream<UserModel> get userConnected {
    return _auth.authStateChanges().asyncMap(
          (user) => UserModel(
            uid: user!.uid,
            email: user.email,
          ),
        );
  }

  Future<UserModel> create(UserModel userModel) async {
    UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: userModel.email!, password: userModel.password!);

    userModel.setUid = userCredential.user!.uid;

    return userModel;
  }

  Future<UserModel> auth(UserModel userModel) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: userModel.email!, password: userModel.password!);

    userModel.setUid = userCredential.user!.uid;

    return userModel;
    } catch (e) {
      userModel.setUid = null;
      return userModel;
    }
    
  }

  Future<void> logout() async {
    try {
      await _auth.signOut();
    } catch (e) {
      print('erreur de déconnection: $e');
    }
    
  }
}
