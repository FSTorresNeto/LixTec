import 'package:flutter_modular/flutter_modular.dart';
import 'package:lixtec/app/presentation/modules/home/home_state.dart';
import 'package:lixtec/app/presentation/modules/home/pages/home_page.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind<HomeState>((i) => HomeState()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/',
      child: (
        _,
        args,
      ) =>
          HomePage(
        userEntity: args.data,
      ),
    ),
  ];
}
