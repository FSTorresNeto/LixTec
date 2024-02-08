import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:lixtec/app/data/data_sources/firebase/auth_data_source.dart';
import 'package:lixtec/app/domain/entities/user_entity.dart';

class AuthDataSourceImpl implements AuthDataSource {
  final GoogleSignIn googleSignin;
  final FirebaseAuth firebaseAuth;
  final FirebaseFirestore fireStore;

  AuthDataSourceImpl({
    required this.googleSignin,
    required this.firebaseAuth,
    required this.fireStore,
  });

  @override
  Future<UserEntity> googleSignIn() async {
    try {
      final googleUser = await googleSignin.signIn();
      final googleAuth = await googleUser?.authentication;

      print(googleUser.toString());
      print(googleAuth.toString());
      if (googleAuth == null) {
        throw 'Falha na autenticação do Google';
      }

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final userAuth =
          (await firebaseAuth.signInWithCredential(credential)).user;
      if (userAuth == null) {
        throw 'Falha na autenticação do usuário';
      }

      final userCollection = fireStore.collection("users");
      final uid = firebaseAuth.currentUser!.uid;

      final userDoc = await userCollection.doc(uid).get();
      if (!userDoc.exists) {
        var user = UserEntity(
          uid: userAuth.uid,
          name: userAuth.displayName ?? "",
          email: userAuth.email ?? "",
          profileUrl: userAuth.photoURL ?? "",
        ).toDocument();

        await userCollection.doc(uid).set(user);
      }

      return UserEntity(
        uid: userAuth.uid,
        name: userAuth.displayName ?? "",
        email: userAuth.email ?? "",
        profileUrl: userAuth.photoURL ?? "",
      );
    } catch (e) {
      log(e.toString());
      print(e.toString());
      throw 'Erro ao autenticar com o Google';
    }
  }

  @override
  Future<UserEntity> signUp(UserEntity userEntity) async {
    try {
      final userCollection = fireStore.collection("users");

      final querySnapshot = await userCollection
          .where("email", isEqualTo: userEntity.email)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        throw 'Já existe uma conta com este e-mail';
      }

      final userCredential = await firebaseAuth.createUserWithEmailAndPassword(
        email: userEntity.email,
        password: userEntity.password,
      );

      final user = userCredential.user;

      if (user == null) {
        throw 'Ocorreu um erro inesperado durante o registro.';
      }

      final userDoc = await userCollection.doc(user.uid).get();

      if (!userDoc.exists) {
        final userEntityToDocument = userEntity.toDocument();

        await userCollection.doc(user.uid).set(userEntityToDocument);
      }

      return UserEntity(
        uid: user.uid,
        name: userEntity.name,
        email: user.email!,
      );
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<UserEntity> signIn(UserEntity userEntity) async {
    try {
      final userCredential = await firebaseAuth.signInWithEmailAndPassword(
        email: userEntity.email,
        password: userEntity.password,
      );

      final userCollection = fireStore.collection("users");
      final userDoc = await userCollection.doc(userCredential.user!.uid).get();

      if (!userDoc.exists) {
        throw "Ocorreu um erro, tente novamente mais tarde!";
      }

      final userData = userDoc.data() as Map<String, dynamic>;

      final user = UserEntity(
        uid: userCredential.user!.uid,
        name: userData['name'] ?? '',
        email: userData['email'] ?? '',
        profileUrl: userData['profileUrl'] ?? '',
      );

      return user;
    } on FirebaseAuthException catch (_) {
      var signInError = "Ocorreu um erro, tente novamente mais tarde!";

      if (_.code == 'INVALID_LOGIN_CREDENTIALS') {
        signInError = "Usuário não encontrado";
      }

      throw signInError;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<UserEntity?> getCurrentUser() async {
    final userCollection = fireStore.collection("users");
    final userDoc =
        await userCollection.doc(firebaseAuth.currentUser?.uid).get();

    if (userDoc.exists) {
      final userData = userDoc.data() as Map<String, dynamic>;

      final user = UserEntity(
        uid: userData['uid'] ?? '',
        name: userData['name'] ?? '',
        email: userData['email'] ?? '',
        profileUrl: userData['profileUrl'] ?? '',
      );

      return user;
    }
    return null;
  }
}
