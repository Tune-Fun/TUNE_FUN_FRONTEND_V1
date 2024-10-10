import 'package:tunefun_front/domain/model/data_state_model.dart';
import 'package:tunefun_front/features/vote/domain/model/response_model.dart';
import 'package:tunefun_front/features/vote/domain/model/upload_model.dart';
import 'package:tunefun_front/features/vote/domain/model/vote_paper_model.dart';

abstract class VoteRepository {
  Future<DataState<ResponseModel>> uploadVote(UploadModel uploadModel);
  Future<DataState<List<VotePaperModel>>> fetchVotePaper(dynamic t, dynamic k);
}
