import 'dart:async';
import 'package:farmers_market/app/models/user.dart';
import 'package:farmers_market/app/services/firestore_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:rxdart/rxdart.dart';

final RegExp regExpEmail = RegExp(
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');

class AuthBloc {
  final _email = BehaviorSubject<String>();
  final _password = BehaviorSubject<String>();
  final _user = BehaviorSubject<User>();
  final _errorMessage = BehaviorSubject<String>();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirestoreService _firestoreService = FirestoreService();

  // get data
  Stream<String> get email => _email.stream.transform(validateEmail);
  Stream<String> get password => _password.stream.transform(validatePassword);
  Stream<String> get errorMessage => _errorMessage.stream;
  Stream<bool> get isValid => CombineLatestStream.combine2(email, password, (email, password) => true);
  Stream<User> get user => _user.stream;
  // Stream<User> get authState => _auth.onAuthStateChanged.map((_userFromFirebase));

  // set data
  Function(String) get changeEmail => _email.sink.add;
  Function(String) get changePassword => _password.sink.add;

  // disposing the streams
  dispose() {
    _email.close();
    _password.close();
    _user.close();
    _errorMessage.close();
  }

  // transformers
  final validateEmail = StreamTransformer<String, String>.fromHandlers(handleData: (email, sink) {
    if (regExpEmail.hasMatch(email.trim())) {
      sink.add(email.trim());
    } else {
      sink.addError('Must be a valid email address');
    }
  });

  final validatePassword = StreamTransformer<String, String>.fromHandlers(handleData: (password, sink) {
    if (password.length >= 8) {
      sink.add(password.trim());
    } else {
      sink.addError('8 Characters minimum');
    }
  });

  // functions
  signupEmail() async {
    try {
      AuthResult authResult = await _auth.createUserWithEmailAndPassword(email: _email.value.trim(), password: _password.value.trim());
      var user = User(userId: authResult.user.uid, email: authResult.user.email);
      await _firestoreService.addUser(user);
      _user.sink.add(user);
    } on PlatformException catch (err) {
      print(err);
      _errorMessage.sink.add(err.message);
    }
  }

  loginEmail() async {
    try {
      AuthResult authResult = await _auth.signInWithEmailAndPassword(email: _email.value.trim(), password: _password.value.trim());
      var user = await _firestoreService.fetchUser(authResult.user.uid);
      _user.sink.add(user);
    } on PlatformException catch (err) {
      print(err);
      _errorMessage.sink.add(err.message);
    }
  }

  Future signout() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e);
    }
  }

  // User _userFromFirebase(FirebaseUser user) {
  //   return user == null ? null : User(userId: user.uid, email: user.email);
  // }

  Future<bool> isLoggedIn() async {
    var firebaseUser = await _auth.currentUser();
    if (firebaseUser == null) return false;

    var user = await _firestoreService.fetchUser(firebaseUser.uid);
    if (user == null) return false;

    _user.sink.add(user);
    return true;
  }

  Future<void> logout() async {
    await _auth.signOut();

    _user.add(null);
  }

  clearErrorMessage() {
    _errorMessage.sink.add('');
  }
}