// Project imports:
import 'package:lixtec/app/domain/entities/trash_list.dart';
import 'package:lixtec/app/domain/repositories/trash_list_repository.dart';

class GetTrashListUseCase {
  final TrashListRepository trashListRepository;

  GetTrashListUseCase({required this.trashListRepository});

  Future<TrashListEntity?> call() async {
    return await trashListRepository.getTrashList();
  }
}
