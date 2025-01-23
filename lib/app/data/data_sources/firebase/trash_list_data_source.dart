// Project imports:
import 'package:lixtec/app/domain/entities/trash_list.dart';

abstract class TrashListDataSource {
  Future<TrashListEntity> getTrashList();
}
