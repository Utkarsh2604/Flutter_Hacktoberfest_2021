import 'package:covico/data/resource.dart';
import 'package:flutter/cupertino.dart';

typedef SuccessBuilder<T> = Widget Function(
    BuildContext context, T data, Resource<T> task);
typedef LoadingBuilder<T> = Widget Function(
    BuildContext context, T data, Resource<T> task);
typedef FailureBuilder<T> = Widget Function(
    BuildContext context, T data, Resource<T> task);

/// StreamBuilder is used in all the places where data (wrapped in a task)
/// is to be displayed from a stream. Most of the streams are wrapped in a [Task],
/// the same logic of building a widget, depending on, data existing in snapshot and
/// status of Resource, is repeated over and over again.
/// This widget wraps that basic logic and provides 3 builders which will
/// be called accordingly.
///
/// [successBuilder] is called when [Task]'s status is [Status.success].
/// [failureBuilder] is called when [Task]'s status is [Status.failure].
/// [loadingBuilder] is called when [Task]'s status is [Status.loading] or
/// there is no data in [StreamBuilder]'s snapshot.
class StreamTaskBuilder<T> extends StatelessWidget {
  final Stream<Resource<T>> stream;
  final SuccessBuilder<T> successBuilder;
  final LoadingBuilder<T> loadingBuilder;
  final FailureBuilder<T> failureBuilder;
  final Resource<T> initialData;

  const StreamTaskBuilder({
    Key key,
    this.stream,
    @required this.successBuilder,
    @required this.loadingBuilder,
    @required this.failureBuilder,
    this.initialData,
  })  : assert(stream != null),
        assert(successBuilder != null),
        assert(failureBuilder != null),
        assert(loadingBuilder != null),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Resource<T>>(
      stream: this.stream,
      initialData: this.initialData,
      builder: (context, snapshot) {
        if (snapshot.hasData && snapshot.data.isSuccess) {
          return this
              .successBuilder(context, snapshot?.data?.data, snapshot.data);
        } else if (snapshot.hasError ||
            (snapshot.hasData &&
                (snapshot.data.isFailure || snapshot.data.isNetworkError))) {
          return this
              .failureBuilder(context, snapshot?.data?.data, snapshot.data);
        } else {
          return this
              .loadingBuilder(context, snapshot?.data?.data, snapshot.data);
        }
      },
    );
  }
}
