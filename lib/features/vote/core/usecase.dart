import 'package:tunefun_front/core/core.dart';

abstract class UseCase<T, P> {
  FutureEither<T> call(P params);
}

class NoParams {}
