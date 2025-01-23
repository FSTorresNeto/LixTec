// Package imports:
import 'package:flutter_modular/flutter_modular.dart';

// Project imports:
import 'package:lixtec/app/presentation/modules/help/help_state.dart';
import 'package:lixtec/app/presentation/modules/help/pages/help_page.dart';

// Project imports:

class HelpModule extends Module {
  @override
  final List<Bind> binds = [
    Bind<HelpState>((i) => HelpState()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/',
      child: (
        _,
        args,
      ) =>
          HelpPage(
        userEntity: args.data,
      ),
    ),
  ];
}
