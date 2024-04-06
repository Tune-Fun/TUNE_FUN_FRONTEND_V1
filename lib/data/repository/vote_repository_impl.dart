import 'package:fpdart/fpdart.dart';
import 'package:tunefun_front/core/core.dart';
import 'package:tunefun_front/features/vote/data/data_source/vote_data_source.dart';
import 'package:tunefun_front/features/vote/data/translator/vote_translator.dart';
import 'package:tunefun_front/features/vote/domain/model/upload_test_model.dart';
import 'package:tunefun_front/features/vote/domain/repository/vote_repository.dart';

class VoteRepositoryImpl implements VoteRepository {
  final VoteDataSource _voteDataSource;
  const VoteRepositoryImpl(this._voteDataSource);
  @override
  FutureEither<List<SongInfo>> searchSong(String artist) async {
    try {
      final response = await _voteDataSource.searchSong(artist);
      return VoteTranslator().translateSongInfo(response);
    } catch (e, trace) {
      return left(Failure(e.toString(), trace));
    }
  }

  @override
  FutureEither uploadVote(UploadTestModel uploadTestModel) {
    throw UnimplementedError();
  }
  /*
    FutureEither<List<VotePaperModel>> getVotesList() async {
    final response = await http.get(Uri.parse(''));
    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      List<VotePaperModel> voteList =
          data.map((item) => VotePaperModel.fromJson(item)).toList();
      return right(voteList);
    } else {
      throw Exception('fail');
    }
  }

  uploadvote(UploadTestModel uploadTestModel) async {
    // final jsonData = uploadTestModel.toJson();
    final response = await http.post(Uri.parse(""));
  }
  */
}
