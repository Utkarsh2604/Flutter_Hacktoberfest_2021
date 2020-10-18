import 'package:covico/constants/spaces.dart';
import 'package:flutter/material.dart';

typedef OnRetry = void Function();

class PrimaryErrorWidget extends StatelessWidget {
  final String title;
  final String message;
  final OnRetry onRetry;
  final Icon icon;

  const PrimaryErrorWidget({
    Key key,
    @required this.message,
    this.title = "Oops!!!",
    this.onRetry,
    @required this.icon,
  })  : assert(title != null && message != null && icon != null),
        super(key: key);

  /// Returns a [PrimaryErrorWidget] with title, message and styling
  /// depending if there is a network error or not denoted by [isNetworkError].
  factory PrimaryErrorWidget.networkErrorOrNot({
    @required BuildContext context,
    @required String message,
    @required bool isNetworkError,
    OnRetry onRetry,
  }) {
    ArgumentError.checkNotNull(context, "context");
    ArgumentError.checkNotNull(message, "message");

    return PrimaryErrorWidget(
      message: isNetworkError ? 'No internet connection' : message,
      onRetry: onRetry,
      icon: isNetworkError ? Icon(Icons.network_check) : Icon(Icons.warning),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(40.0),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            _errorIcon,
            Spaces.h20,
            _title,
            Spaces.h20,
            _description,
            Spaces.h30,
            _retryButton,
          ],
        ),
      ),
    );
  }

  Widget get _title {
    return Text(
      this.title,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 32.0,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget get _errorIcon {
    return Icon(
      Icons.warning,
      size: 64.0,
      color: Colors.grey,
    );
  }

  Widget get _description {
    return Text(
      this.message,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 16.0,
      ),
    );
  }

  Widget get _retryButton {
    return RawMaterialButton(
      fillColor: Colors.blueAccent,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4.0),
      ),
      elevation: 0.0,
      highlightElevation: 0.0,
      padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 10.0),
      onPressed: this.onRetry,
      child: Text(
        'Retry',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
          fontSize: 16.0,
        ),
      ),
    );
  }
}
