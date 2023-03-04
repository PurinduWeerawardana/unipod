import 'package:flutter/cupertino.dart';

import '../features/authentication/screens/models/user_model.dart';
import '../services/firebase_auth_methods.dart';

class UserProvider extends ChangeNotifier{
  UserModel? _user;
  final FirebaseAuthMethods _authMethods = FirebaseAuthMethods();

  UserModel get getUser => _user!;

  Future<void> refreshUser() async{
    UserModel user = await _authMethods.getUserDetails();
    _user = user;
    notifyListeners();
  }

}