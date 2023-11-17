
import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:social_logins_flutter/model/user_model.dart';
import 'package:social_logins_flutter/utils/routes/routes_name.dart';
import 'package:social_logins_flutter/view/authentication/login/login_view.dart';
import 'package:social_logins_flutter/view/home/home_view.dart';

class LoginVm extends ChangeNotifier {

  bool _isLoading = false;
  bool _isLoggedIn = false;
  String _userName = '';
  String _userProfile = '';
  late BuildContext context;

  bool get isLoading => _isLoading;
  bool get isLoggedIn => _isLoggedIn;
  String get userName => _userName;
  String get userProfile => _userProfile;


  LoginVm(this.context);

  setIsLoading(bool status) {
    _isLoading = status;
    notifyListeners();
  }
  setIsLoggedIn(bool status) {
    _isLoggedIn = status;
    notifyListeners();
  }

  signInWithFacebookButton() async {
    signInWithFacebook().then((value) {
      setIsLoading(false);

      if(value.user != null) {
        _userName = value.user!.displayName.toString();
        _userProfile = value.user!.photoURL.toString();
        final userModel = UserModel(name: _userName, photo: _userProfile);
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) =>  HomeView(userModel: userModel)));
       // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>  HomeView(userModel: userModel)), (route) => false);

      } else {
        print('Error while login with google');
      }
    });
  }
  Future<UserCredential> signInWithFacebook() async {
    // Trigger the sign-in flow
    final LoginResult loginResult = await FacebookAuth.instance.login();

    // Create a credential from the access token
    final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(loginResult.accessToken!.token);

    // Once signed in, return the UserCredential
    return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  }
  signInWithGoogleButton() async {
    signInWithGoogle().then((value) {
      setIsLoading(false);

      if(value.user != null) {
        _userName = value.user!.displayName.toString();
        _userProfile = value.user!.photoURL.toString();
        final userModel = UserModel(name: _userName, photo: _userProfile);
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) =>  HomeView(userModel: userModel)));
        // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>  HomeView(userModel: userModel)), (route) => false);

      } else {
        print('Error while login with google');
      }
    });
  }
  Future<UserCredential> signInWithGoogle() async {
    setIsLoading(true);
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
  signOut() async {
    await FirebaseAuth.instance.signOut().whenComplete(() {

     // Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const LoginView()), (route) => false);

      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const LoginView()));
    });

  }


}