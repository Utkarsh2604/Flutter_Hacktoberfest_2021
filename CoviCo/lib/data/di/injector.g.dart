// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'injector.dart';

// **************************************************************************
// InjectorGenerator
// **************************************************************************

class _$Injector extends Injector {
  void common() {
    final Container container = Container();
    container.registerFactory<StateDataRepository, StateDataRepositoryImpl>(
        (c) => StateDataRepositoryImpl(c<NetworkService>(), c<AppDatabase>()));
    container.registerSingleton((c) => AppDatabase.init());
  }

  void development() {
    final Container container = Container();
    container.registerSingleton((c) => NetworkService.development());
  }

  void production() {
    final Container container = Container();
    container.registerSingleton((c) => NetworkService.production());
  }
}
