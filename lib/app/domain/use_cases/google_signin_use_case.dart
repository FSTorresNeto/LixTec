import 'package:lixtec/app/domain/entities/user_entity.dart';
import 'package:lixtec/app/domain/repositories/auth_repository.dart';

class GoogleSignUseCase {
  final AuthRepository authRepository;

  GoogleSignUseCase({required this.authRepository});

  Future<UserEntity> call() async {
    return await authRepository.googleSignIn();
  }
}
