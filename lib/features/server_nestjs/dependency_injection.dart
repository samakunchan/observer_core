import 'package:observer_core/features/server_nestjs/feature_server_nestjs_export.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

Future<void> initServerNestJs({required String wsBaseUrl}) async {
  final Dio dio = Dio();
  const FlutterSecureStorage secureStorage = FlutterSecureStorage();

  ServerFeature.sl

    /// SERVICES
    ..registerSingleton<ServerNestjsService>(ServerNestjsService(dio, baseUrl: wsBaseUrl))
    ..registerSingleton<InMemoryService>(InMemoryService(secureStorage, baseUrl: wsBaseUrl))

    /// SOURCES
    ..registerSingleton<AbstractServerNestjsSource>(ServerNestjsSource(remoteService: ServerFeature.sl()))
    ..registerSingleton<AbstractInMemorySource>(InMemorySource(secureStorage: ServerFeature.sl()))

    /// REPOSITORIES
    ..registerSingleton<AbstractServerNestjsRepository>(ServerNestjsRepository(remoteSource: ServerFeature.sl()))
    ..registerSingleton<AbstractInMemoryRepository>(InMemoryRepository(inMemorySource: ServerFeature.sl()));
}
