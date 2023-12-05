import 'package:lixtec/app/domain/entities/qr_code.dart';

abstract class QrCodeRepository {
  Future<QrCodeEntity> updateDepositsTotalValue(QrCodeEntity qrCodeEntity);
}
