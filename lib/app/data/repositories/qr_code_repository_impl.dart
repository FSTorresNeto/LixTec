import 'package:lixtec/app/data/data_sources/firebase/qr_code_data_source.dart';
import 'package:lixtec/app/domain/entities/qr_code.dart';
import 'package:lixtec/app/domain/repositories/qr_code.dart';

class QrCodeRepositoryImpl implements QrCodeRepository {
  final QrCodeDataSource qrCodeDataSource;

  QrCodeRepositoryImpl({required this.qrCodeDataSource});

  @override
  Future<QrCodeEntity> updateDepositsTotalValue(QrCodeEntity userEntity) async {
    return await qrCodeDataSource.updateDepositsTotalValue(userEntity);
  }
}
