// Package imports:
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lixtec/app/presentation/modules/trash_list/trast_list_state.dart';
import 'package:lixtec/app/presentation/modules/trash_list/pages/trast_list_page.dart';

// Project imports:

class TrashListModule extends Module {
  @override
  final List<Bind> binds = [
    Bind<TrashListState>((i) => TrashListState()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/',
      child: (
        _,
        args,
      ) =>
          TrashListPage(
        userEntity: args.data,
      ),
    ),
  ];
}
