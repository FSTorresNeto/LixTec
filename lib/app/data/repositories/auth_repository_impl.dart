import 'package:lixtec/app/data/data_sources/firebase/auth_data_source.dart';
import 'package:lixtec/app/domain/entities/user_entity.dart';
import 'package:lixtec/app/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDataSource authDataSource;

  AuthRepositoryImpl({required this.authDataSource});

  @override
  Future<UserEntity> googleSignIn() async {
    return await authDataSource.googleSignIn();
  }

  @override
  Future<UserEntity> signUp(UserEntity userEntity) async {
    return await authDataSource.signUp(userEntity);
  }

  @override
  Future<UserEntity> signIn(UserEntity userEntity) async {
    return await authDataSource.signIn(userEntity);
  }

  @override
  Future<UserEntity?> getCurrentUser() async {
    return await authDataSource.getCurrentUser();
  }
}
