import 'dart:async';

import 'package:observer_core/features/authentication/users/datas/models/models_export.dart';

abstract class AbstractUserInfosSource {
  Future<UserInfosModel> getUserInfos();
  Future<void> postUserInfos(UserInfosModel userInfos);
}
