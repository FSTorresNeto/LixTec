import 'package:lixtec/app/domain/entities/user_entity.dart';
import 'package:lixtec/app/domain/repositories/auth_repository.dart';

class SignInUseCase {
  final AuthRepository authRepository;

  SignInUseCase({required this.authRepository});

  Future<UserEntity> call(UserEntity userEntity) async {
    return await authRepository.signIn(userEntity);
  }
}
