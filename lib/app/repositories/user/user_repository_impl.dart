import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:todo_list_provider/app/exceptions/auth_exception.dart';
import 'package:todo_list_provider/app/repositories/user/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final FirebaseAuth _firebaseAuth;

  UserRepositoryImpl({required FirebaseAuth firebaseAuth})
      : _firebaseAuth = firebaseAuth;

  @override
  Future<User?> register(String email, String password) async {
    try {
      final userCredencial = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);

      return userCredencial.user;
    } on FirebaseAuthException catch (e, s) {
      print(e);
      print(s);
      if (e.code == 'email-already-in-use') {
        final user = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        if (user.user?.email != '') {
          throw AuthException(
            message: 'Email já utilizado. Por favor escolha outro email',
          );
        } else {
          throw AuthException(
            message:
                'Você se cadastrou no TodoList pelo Google. Por favor utilize ele para entrar',
          );
        }
      } else {
        throw AuthException(message: e.message ?? 'Erro ao registrar usuário');
      }
    }
  }

  @override
  Future<User?> login(String email, String password) async {
    try {
      final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw AuthException(message: 'Usuário e/ou senha inválidos');
      } else if (e.code == 'wrong-password') {
        throw AuthException(message: 'Usuário e/ou senha inválidos');
      }
    }
    return null;
  }

  @override
  Future<void> forgotPassword(String email) async {
    try {
      final loginMethods =
          await _firebaseAuth.fetchSignInMethodsForEmail(email);

      if (loginMethods.isEmpty) {
        try {
          await _firebaseAuth.sendPasswordResetEmail(email: email);
        } catch (e) {
          print('e: $e');
          throw AuthException(message: "E-mail nao cadastrado");
        }
      } else {
        throw AuthException(
            message:
                "Cadastro realizado com o google, não pode ser resetado a senha");
      }
    } on PlatformException catch (e, s) {
      print('e: $e');
      print('s: $s');
      throw AuthException(message: "Erro ao recuperar senha");
    }
  }
}
