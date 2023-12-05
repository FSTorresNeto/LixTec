import 'package:lixtec/app/domain/entities/qr_code.dart';

abstract class QrCodeDataSource {
  Future<QrCodeEntity> updateDepositsTotalValue(QrCodeEntity qrCodeEntity);
}
