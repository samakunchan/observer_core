import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:observer_core/features/authentication/users/datas/models/models_export.dart';

abstract class UserInfosService {
  factory UserInfosService(FlutterSecureStorage secureStorage) = _UserInfosService;

  Future<void> storeUserInfos({required UserInfosModel userInfos});
  Future<UserInfosModel> getUserInfos();
}

class _UserInfosService implements UserInfosService {
  _UserInfosService(this._secureStorage);
  final FlutterSecureStorage _secureStorage;

  @override
  Future<void> storeUserInfos({required UserInfosModel userInfos}) async {
    await _secureStorage.delete(key: 'USERINFOS');
    await _secureStorage.write(key: 'USERINFOS', value: jsonEncode(userInfos.toJson()));
  }

  @override
  Future<UserInfosModel> getUserInfos() async {
    final String userInfosStringifield = await _secureStorage.read(key: 'USERINFOS') ?? jsonEncode(FakeUserInfosModel.example);
    final Map<String, dynamic> userInfosParsed = jsonDecode(userInfosStringifield) as Map<String, dynamic>;

    return UserInfosModel.fromJson(userInfosParsed);
  }
}
