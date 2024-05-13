import 'package:tunefun_front/core/core.dart';
import 'package:tunefun_front/domain/model/data_state_model.dart';
import 'package:tunefun_front/features/vote/domain/model/upload_test_model.dart';

abstract class VoteRepository {
  Future<DataState<List<SongInfo>>> searchSong(String artist);
  Future<DataState> uploadVote(UploadTestModel uploadTestModel);
}
