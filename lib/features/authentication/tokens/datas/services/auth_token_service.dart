import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:observer_core/features/authentication/tokens/datas/models/models_export.dart';

abstract class AuthTokenService {
  factory AuthTokenService(FlutterSecureStorage secureStorage) = _AuthTokenService;

  Future<void> storeAuthToken({required AuthTokenModel authToken});
  Future<AuthTokenModel> getAuthToken();
}

class _AuthTokenService implements AuthTokenService {
  _AuthTokenService(this._secureStorage);
  final FlutterSecureStorage _secureStorage;

  @override
  Future<void> storeAuthToken({required AuthTokenModel authToken}) async {
    await _secureStorage.delete(key: 'AUTHTOKENS');
    await _secureStorage.write(key: 'AUTHTOKENS', value: jsonEncode(authToken.toJson()));
  }

  @override
  Future<AuthTokenModel> getAuthToken() async {
    final String tokensStringifield = await _secureStorage.read(key: 'AUTHTOKENS') ?? jsonEncode(FakeAuthTokenModel.example);
    final Map<String, dynamic> tokensParsed = jsonDecode(tokensStringifield) as Map<String, dynamic>;

    return AuthTokenModel.fromJson(tokensParsed);
  }
}
