import 'package:covico/data/db/app_database.dart';
import 'package:covico/data/network/network_service.dart';
import 'package:covico/data/repository/state_data_repository/state_data_repository.dart';
import 'package:covico/data/repository/state_data_repository/state_data_repository_impl.dart';
import 'package:covico/util/app_config.dart';
import 'package:kiwi/kiwi.dart';

part 'injector.g.dart';

abstract class Injector {
  @Register.factory(StateDataRepository, from: StateDataRepositoryImpl)
  @Register.singleton(AppDatabase, constructorName: 'init')
  void common();

  @Register.singleton(NetworkService, constructorName: 'development')
  void development();

  @Register.singleton(NetworkService, constructorName: 'production')
  void production();

  static void setup() {
    final injector = _$Injector();
    injector.common();
    if (AppConfig.appFlavor == AppFlavor.development) {
      injector.development();
    } else {
      injector.production();
    }
  }
}
