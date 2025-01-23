// Project imports:
import 'package:lixtec/app/domain/entities/user_entity.dart';
import 'package:lixtec/app/domain/repositories/auth_repository.dart';

class GetCurrentUserUseCase {
  final AuthRepository authRepository;

  GetCurrentUserUseCase({required this.authRepository});

  Future<UserEntity?> call() async {
    return await authRepository.getCurrentUser();
  }
}
