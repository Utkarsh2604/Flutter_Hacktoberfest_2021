import 'package:meta/meta.dart';

enum Status { success, failure, loading }

/// Resource is a convenience class to wrap around data.
/// For Example: It can denote the status of a response received from a network
/// request.
class Resource<T> {
  final T data;
  final String message;
  final Status status;
  final int statusCode;

  /// Should be set to true only if there is no internet connection.
  final bool isNetworkError;

  bool get isSuccess => this.status == Status.success;

  bool get isLoading => this.status == Status.loading;

  bool get isFailure => this.status == Status.failure;

  Resource({
    @required this.data,
    @required this.message,
    @required this.status,
    this.statusCode = -1,
    this.isNetworkError = false,
  });

  factory Resource.success({
    T data,
    String message,
  }) {
    return Resource(
      data: data,
      message: message,
      status: Status.success,
      isNetworkError: false,
      statusCode: 200,
    );
  }

  factory Resource.failure({
    T data,
    String message,
    bool isNetworkError = false,
    int statusCode,
  }) {
    ArgumentError.checkNotNull(isNetworkError, "isNetworkError");

    return Resource(
      data: data,
      message: message,
      status: Status.failure,
      isNetworkError: isNetworkError,
      statusCode: statusCode,
    );
  }

  factory Resource.loading({
    T data,
    String message,
  }) {
    return Resource(
      data: data,
      message: message,
      status: Status.loading,
      isNetworkError: false,
    );
  }

  Resource<D> copyWithNewData<D>({
    D data,
  }) {
    return Resource<D>(
      data: data ?? this.data,
      message: this.message,
      status: this.status,
      isNetworkError: this.isNetworkError,
    );
  }

  @override
  String toString() {
    return "{Data: ${data.toString()}, "
        "Status: $status, "
        "Message: $message, "
        "isNetworkError: $isNetworkError"
        "}";
  }
}
