// Project imports:
import 'package:lixtec/app/data/data_sources/firebase/trash_list_data_source.dart';
import 'package:lixtec/app/domain/entities/trash_list.dart';
import 'package:lixtec/app/domain/repositories/trash_list_repository.dart';

class TrashListRepositoryImpl implements TrashListRepository {
  final TrashListDataSource trashListDataSource;

  TrashListRepositoryImpl({required this.trashListDataSource});

  @override
  Future<TrashListEntity> getTrashList() async {
    return await trashListDataSource.getTrashList();
  }
}
