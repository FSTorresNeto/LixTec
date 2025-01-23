// Package imports:
import 'package:flutter_modular/flutter_modular.dart';

// Project imports:
import 'package:lixtec/app/presentation/modules/about/about_state.dart';
import 'package:lixtec/app/presentation/modules/about/pages/about_page.dart';

// Project imports:

class AboutModule extends Module {
  @override
  final List<Bind> binds = [
    Bind<AboutState>((i) => AboutState()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/',
      child: (
        _,
        args,
      ) =>
          AboutPage(
        userEntity: args.data,
      ),
    ),
  ];
}
