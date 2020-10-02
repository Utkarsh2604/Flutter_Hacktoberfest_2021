import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProgressBar extends StatelessWidget {
  final String loadingMessage;

  const ProgressBar({Key key, this.loadingMessage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(loadingMessage),
          SizedBox(height: 12.0),
          CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation(Colors.blue),
          ),
        ],
      ),
    );
  }
}

class Error extends StatelessWidget {
  final String errorMessage;
  final Function onRetry;

  const Error({Key key, this.errorMessage, this.onRetry}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            errorMessage,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 12.0),
          RaisedButton(
            color: Colors.blue,
            child: Text(
              'Retry',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: onRetry,
          )
        ],
      ),
    );
  }
}
