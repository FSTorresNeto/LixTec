import 'package:lixtec/app/domain/entities/user_entity.dart';

abstract class AuthDataSource {
  Future<UserEntity> googleSignIn();
  Future<UserEntity> signUp(UserEntity userEntity);
  Future<UserEntity> signIn(UserEntity userEntity);
  Future<UserEntity?> getCurrentUser();
}
