import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../dto/user_dto.dart';
import '../contracts/i_user_datasource.dart';
import '../local/local_storage_datasource.dart';
import '../../../domain/entities/user_entity.dart';
import '../../../domain/entities/sign_in_entity.dart';

class UserDatasourceRemoteImp implements IUserDatasource {
  final FirebaseAuth auth;
  final GoogleSignIn googleSignIn;
  final FirebaseFirestore firestore;
  final LocalStorageDatasource localStorage;

  UserDatasourceRemoteImp({
    required this.auth,
    required this.firestore,
    required this.googleSignIn,
    required this.localStorage
  });

  @override
  Future<void> forgotPassword(String email) async => await auth.sendPasswordResetEmail(email: email);

  @override
  Future<String?> getCurrentUserId() async => auth.currentUser?.uid;

  @override
  Future<void> getUpdateUser(UserEntity entity) async { 
    final CollectionReference<Map<String, dynamic>> userCollection = firestore.collection("users");    
    if (entity.name != null) await auth.currentUser?.updateDisplayName(entity.name);
    if (entity.email != null) auth.currentUser?.verifyBeforeUpdateEmail(entity.email!);

    final uid = await getCurrentUserId();

    final DocumentSnapshot<Map<String, dynamic>> snapshot = await userCollection.doc(uid).get();
    final UserDTO userParse = UserDTO.fromJson(snapshot);
    localStorage.put("user", jsonEncode(userParse.toJson()));
  }

  @override
  Future<Either<Exception, UserCredential>> googleAuth() async { 
    final CollectionReference<Map<String, dynamic>> userCollection = firestore.collection("users");
    try {
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken
      );
      final UserCredential userCredential = await auth.signInWithCredential(credential);
      await getCreateCurrentUser(UserDTO(
        email: userCredential.user?.email,
        uid: userCredential.user?.uid,
        name: userCredential.user?.displayName,
        profileUrl: userCredential.user?.photoURL
      ));
      await userCollection.doc(userCredential.user?.uid).get();
      await localStorage.put("user", jsonEncode(UserDTO(
        email: userCredential.user?.email,
        uid: userCredential.user?.uid,
        name: userCredential.user?.displayName,
        profileUrl: userCredential.user?.photoURL
      ).toJson()));
      return Right(userCredential);
    } catch (e) {
      return Left(Exception("Falha ao tentar logar!"));
    }
  }

  @override
  Future<bool> isSignIn() async => auth.currentUser?.uid != null;

  @override
  Future<Either<Exception, UserCredential>> signIn(SignInEntity signIn) async {
    final CollectionReference<Map<String, dynamic>> userCollection = firestore.collection("users");
    try {
      final UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: signIn.email, 
        password: signIn.password
      );
      final DocumentSnapshot<Map<String, dynamic>> snapshot = await userCollection.doc(userCredential.user?.uid).get();
      final UserDTO userParse = UserDTO.fromJson(snapshot);
      await localStorage.put("user", jsonEncode(userParse.toJson()));
      return Right(userCredential);
    } on FirebaseAuthException {
      return Left(Exception('Falha ao tentar logar!'));
    }
  }

  @override
  Future<void> signOut() async => await auth.signOut();

  @override
  Future<Either<Exception, UserCredential>> signUp(UserEntity user) async {
    try {
      final userCredential = await auth.createUserWithEmailAndPassword(
        email: user.email!,
        password: user.password!
      );
      await getCreateCurrentUser(user.copyWith(
        name: user.name,
        uid: userCredential.user?.uid,
      ));
      return Right(userCredential);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return Left(Exception("A palavra-passe fornecida é demasiado fraca."));
      } else if (e.code == 'email-already-in-use') {
        return Left(Exception("O e-mail já em uso"));
      } else {
        return Left(Exception("Verifique sua ligação à internet"));
      }
    } catch (e) {
      return Left(Exception("Verifique sua ligação à internet"));
    }
  }
  
  @override
  Future<void> getCreateCurrentUser(UserEntity user) async {
    final CollectionReference<Map<String, dynamic>> userCollection = firestore.collection("users");
    final uid = await getCurrentUserId();
    userCollection.doc(uid).get().then((userDoc) {
      if (!userDoc.exists) {
        final newUser = UserDTO(
          email: user.email,
          uid: user.uid,
          name: user.name,
          password: user.password,
          profileUrl: user.profileUrl,
          status: user.status
        ).toJson();
        userCollection.doc(uid).set(newUser);
      } else {
        debugPrint("User already exists");
        return;
      }
    });
  }
}
