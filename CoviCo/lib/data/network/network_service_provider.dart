import 'package:flutter/cupertino.dart';

import 'network_service.dart';

class NetworkServiceProvider extends InheritedWidget {
  final NetworkService networkService;

  NetworkServiceProvider({
    @required this.networkService,
    Widget child,
  })  : assert(networkService != null),
        super(child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }

  static NetworkService of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType(
            aspect: NetworkServiceProvider) as NetworkServiceProvider)
        .networkService;
  }
}
