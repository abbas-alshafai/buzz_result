import 'package:buzz_logger/models/log.dart';
import 'package:buzz_utils/buzz_utils.dart';

class Result<T> {

  final bool isSuccessful;
  final T? obj;
  final dynamic alt;
  final Log? log;

  Result({
    this.isSuccessful = false,
    Log? log,
    this.obj,
    this.alt,
  }) : log = log ?? Log();

  bool get hasFailed => !isSuccessful;

  bool get hasFailedOrNull => hasFailed || obj == null;

  bool get isSuccessfulObj => !hasFailedOrNull;

  factory Result.success({T? obj, Log? log}) =>
      Result(obj: obj, log: log, isSuccessful: true);

  factory Result.error({
    String? msg,
    StackTrace? stacktrace,
    T? obj,
    Log? log,
    bool bypassRepoInsertion = false,
  }) =>
      Result(
        obj: obj,
        isSuccessful: false,
        log: log ??
            Log(
              logLevel: LogLevel.ERROR,
              msg: msg,
              bypassRepoInsertion: bypassRepoInsertion,
              stacktrace: stacktrace,
            ),
      );
}
