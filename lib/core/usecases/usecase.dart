import 'package:dartz/dartz.dart';
import '../error/failures.dart';

/// Base class for all use cases.
///
/// [Type] — the success return type.
/// [Params] — input parameters (use [NoParams] when none needed).
abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

/// Used when a use case requires no parameters.
final class NoParams {
  const NoParams();
}
