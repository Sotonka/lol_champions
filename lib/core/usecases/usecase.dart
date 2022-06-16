import 'package:dartz/dartz.dart';
import 'package:lol_champions/core/error/failure.dart';

// юзкейс с параметрами
// нужен в случае пагинации на главном экране,
// куда будет передаваться количество чемпионов
abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

// юзкейс без параметров
abstract class UseCaseNoP<Type> {
  Future<Either<Failure, Type>> call();
}
