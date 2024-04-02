import 'package:get_it/get_it.dart';
import 'package:tunefun_front/features/vote/core/vote_usecase.dart';
import 'package:tunefun_front/features/vote/data/data_source/vote_data_source.dart';
import 'package:tunefun_front/features/vote/domain/repository/vote_repository.dart';
import 'package:tunefun_front/features/vote/domain/usecase/vote_usecase.dart';
import 'package:tunefun_front/repository/repository.dart';

final getIt = GetIt.instance;

void setupInjector() {
  // data source
  getIt.registerLazySingleton<VoteDataSource>(() => VoteDataSource());

  // repository
  getIt
      .registerLazySingleton<VoteRepository>(() => VoteRepositoryImpl(getIt()));

  // usecase
  getIt.registerLazySingleton<VoteUseCaseImpl>(() => VoteUseCaseImpl(getIt()));
}
