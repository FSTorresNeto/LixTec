import 'package:lixtec/app/domain/entities/trash_list.dart';

abstract class TrashListRepository {
  Future<TrashListEntity?> getTrashList();
}
