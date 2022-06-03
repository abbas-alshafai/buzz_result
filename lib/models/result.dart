import 'package:buzz_logger/models/log.dart';

class Result<T> {
  final bool isSuccessful;
  final T? obj;
  final dynamic alt;
  final Log? log;

  Result({
    this.isSuccessful = false,
    this.log,
    this.obj,
    this.alt,
  });

  factory Result.success({
    final T? obj,
    final Log? log,
    final dynamic alt,
  }) =>
      Result(
        obj: obj,
        log: log,
        alt: alt,
        isSuccessful: true,
      );

  factory Result.error({
    final String? msg,
    final StackTrace? stacktrace,
    final T? obj,
    final Log? log,
    final dynamic alt,
    final String? translationKey,
  }) =>
      Result(
        obj: obj,
        alt: alt,
        isSuccessful: false,
        log: log ??
            Log(
              logLevel: LogLevel.error,
              msg: msg,
              translationKey: translationKey,
              stacktrace: stacktrace,
            ),
      );

  bool get hasFailed => !isSuccessful;

  bool get hasFailedOrNull => hasFailed || obj == null;

  bool get isSuccessfulObj => !hasFailedOrNull;
}
