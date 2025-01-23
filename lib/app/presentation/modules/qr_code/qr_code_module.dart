// Package imports:
import 'package:flutter_modular/flutter_modular.dart';

// Project imports:
import 'package:lixtec/app/presentation/modules/qr_code/pages/qr_code_page.dart';
import 'package:lixtec/app/presentation/modules/qr_code/qr_code_state.dart';

// Project imports:

class QrCodeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind<QrCodeState>((i) => QrCodeState()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/',
      child: (
        _,
        args,
      ) =>
          QrCodePage(
        userEntity: args.data,
      ),
    ),
  ];
}
