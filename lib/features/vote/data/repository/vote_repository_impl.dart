import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tunefun_front/domain/model/data_state_model.dart';
import 'package:tunefun_front/features/vote/data/data_source/vote_data_source.dart';
import 'package:tunefun_front/features/vote/data/translator/vote_translator.dart';
import 'package:tunefun_front/features/vote/domain/model/response_model.dart';
import 'package:tunefun_front/features/vote/domain/model/upload_model.dart';
import 'package:tunefun_front/features/vote/domain/model/vote_paper_model.dart';
import 'package:tunefun_front/features/vote/domain/repository/vote_repository.dart';

final voteRepositoryProvider = Provider<VoteRepositoryImpl>((ref) {
  return VoteRepositoryImpl(ref);
});

class VoteRepositoryImpl implements VoteRepository {
  final Ref ref;
  const VoteRepositoryImpl(this.ref);

  @override
  Future<DataState<ResponseModel>> uploadVote(UploadModel uploadModel) async {
    try {
      final response =
          await ref.read(voteDataSourceProvider).uploadvote(uploadModel);
      return DataState.success(
          ResponseModel(code: response['code'], message: response['message']));
    } catch (e) {
      return DataState.error(Exception(), e.toString());
    }
  }

  @override
  Future<DataState<List<VotePaperModel>>> fetchVotePaper(
      dynamic t, dynamic k) async {
    try {
      final response =
          await ref.read(voteDataSourceProvider).fetchVotePaper(0, "type");
      List<dynamic> contents = response["data"]["content"];
      return VoteTranslator().translateVotePaper(contents);
    } catch (e) {
      return DataState.error(Exception(), e.toString());
    }
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
