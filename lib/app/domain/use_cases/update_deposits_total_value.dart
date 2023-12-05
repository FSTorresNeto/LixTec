import 'package:lixtec/app/domain/entities/qr_code.dart';
import 'package:lixtec/app/domain/repositories/qr_code.dart';

class UpdateDepositsTotalValueUseCase {
  final QrCodeRepository qrCodeRepository;

  UpdateDepositsTotalValueUseCase({required this.qrCodeRepository});

  Future<QrCodeEntity> call(QrCodeEntity qrCodeEntity) async {
    return await qrCodeRepository.updateDepositsTotalValue(qrCodeEntity);
  }
}
