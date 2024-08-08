import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:observer_core/features/server_nestjs/feature_server_nestjs_export.dart';

Future<void> initServerNestJs({required String wsBaseUrl}) async {
  final Dio dio = Dio();
  const FlutterSecureStorage secureStorage = FlutterSecureStorage();

  ServerFeature.sl

    /// SERVICES
    ..registerSingleton<ServerNestjsService>(ServerNestjsService(dio, baseUrl: wsBaseUrl))
    ..registerSingleton<InMemoryApiNestjsService>(InMemoryApiNestjsService(secureStorage, baseUrl: wsBaseUrl))

    /// SOURCES
    ..registerSingleton<AbstractServerNestjsSource>(ServerNestjsSource(remoteService: ServerFeature.sl()))
    ..registerSingleton<AbstractInMemoryApiNestjsSource>(InMemoryApiNestjsSource(secureStorage: ServerFeature.sl()))

    /// REPOSITORIES
    ..registerSingleton<AbstractServerNestjsRepository>(ServerNestjsRepository(remoteSource: ServerFeature.sl()))
    ..registerSingleton<AbstractInMemoryApiNestjsRepository>(InMemoryApiNestjsRepository(inMemorySource: ServerFeature.sl()));
}
