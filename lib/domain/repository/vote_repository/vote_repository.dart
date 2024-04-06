import 'package:tunefun_front/core/core.dart';
import 'package:tunefun_front/features/vote/domain/model/upload_test_model.dart';

abstract class VoteRepository {
  FutureEither<List<SongInfo>> searchSong(String artist);
  FutureEither uploadVote(UploadTestModel uploadTestModel);
}
