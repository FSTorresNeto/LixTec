import 'package:lixtec/app/domain/entities/user_entity.dart';
import 'package:lixtec/app/domain/repositories/auth_repository.dart';

class SignUpUseCase {
  final AuthRepository authRepository;

  SignUpUseCase({required this.authRepository});

  Future<UserEntity> call(UserEntity userEntity) async {
    return await authRepository.signUp(userEntity);
  }
}
