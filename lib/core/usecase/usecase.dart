import 'package:woudy_customers_app/core/utils/typedefs.dart';

abstract class UseCase<Type, Params> {
  FutureResult<Type> call(Params params);
}

/// Class to handle when useCase don't need params
class NoParams {}
