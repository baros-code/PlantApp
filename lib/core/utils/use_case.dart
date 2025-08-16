import 'dart:async';

import 'result.dart';

/// Base class for standard use cases.
///
/// Every standard use case should extend this class.
///
/// If any of [TInput], [TOutput] is not needed,
/// void can be passed as a generic type to be ignored.
abstract class UseCase<TInput, TOutput extends Object> {
  UseCase();

  /// Executes use case with the given [params] and
  /// returns a FutureOr of a [TOutput] instance.
  FutureOr<Result<TOutput, Failure>> call({TInput? params});
}
