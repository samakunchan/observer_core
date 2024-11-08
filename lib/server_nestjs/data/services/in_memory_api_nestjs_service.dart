import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:observer_core/constantes.dart';
import 'package:observer_core/models/environment/environment_model.dart';
import 'package:observer_core/utils.dart';
import 'package:retrofit/dio.dart';

abstract class InMemoryApiNestjsService {
  factory InMemoryApiNestjsService(FlutterSecureStorage secureStorage, {String baseUrl}) = _InMemoryApiNestjsService;

  Future<HttpResponse<dynamic>> getEnvironments();
  Future<HttpResponse<dynamic>> postEnvironments({required String body});
  Future<HttpResponse<dynamic>> searchEnvironments({required String body});
  Future<HttpResponse<dynamic>> searchStrictEnvironments({required String body});
}

class _InMemoryApiNestjsService implements InMemoryApiNestjsService {
  _InMemoryApiNestjsService(this._secureStorage, {this.baseUrl}) {
    baseUrl ??= MainProject.apiUrl;
  }

  String? baseUrl;

  final FlutterSecureStorage _secureStorage;

  @override
  Future<HttpResponse<dynamic>> getEnvironments() async {
    final String environmentsInString = await _secureStorage.read(key: 'ENVIRONMENTS') ?? '[]';
    final List<dynamic> environmentsResponse = jsonDecode(environmentsInString) as List<dynamic>;
    return HttpResponse<dynamic>(environmentsResponse, Response<dynamic>(requestOptions: RequestOptions()));
  }

  @override
  Future<HttpResponse<dynamic>> postEnvironments({required String body}) async {
    await _secureStorage.delete(key: 'ENVIRONMENTS');
    await _secureStorage.write(key: 'ENVIRONMENTS', value: body);
    // final String categoriesInString = await _secureStorage.read(key: 'ENVIRONMENTS') ?? '[]';
    // logger.f('Post des environnements dans la base local:\n $categoriesInString');
    return HttpResponse<dynamic>(
      <String, dynamic>{'message': 'success de l‘ajout dans le storage'},
      Response<dynamic>(requestOptions: RequestOptions()),
    );
  }

  @override
  Future<HttpResponse<dynamic>> searchEnvironments({required String body}) async {
    final String environmentsInString = await _secureStorage.read(key: 'ENVIRONMENTS') ?? '[]';
    final List<dynamic> environmentsResponse = jsonDecode(environmentsInString) as List<dynamic>;

    final List<EnvironmentModel> environments =
        environmentsResponse.map((data) => data as Map<String, dynamic>).toList().map(EnvironmentModel.fromJson).toList();
    final List<EnvironmentModel> environementFiltered = environments.where((EnvironmentModel env) {
      return env.title == '';
    }).toList();

    logger.i('InMemoryApiNestjsService - $environementFiltered');

    return HttpResponse<dynamic>(
      <String, dynamic>{'message': 'success de l‘ajout dans le storage'},
      Response<dynamic>(requestOptions: RequestOptions()),
    );
  }

  @override
  Future<HttpResponse<dynamic>> searchStrictEnvironments({required String body}) async {
    await _secureStorage.delete(key: 'ENVIRONMENTS');
    await _secureStorage.write(key: 'ENVIRONMENTS', value: body);

    return HttpResponse<dynamic>(
      <String, dynamic>{'message': 'success de l‘ajout dans le storage'},
      Response<dynamic>(requestOptions: RequestOptions()),
    );
  }
}
