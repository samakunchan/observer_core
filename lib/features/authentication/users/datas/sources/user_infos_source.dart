import 'package:observer_core/features/authentication/users/datas/models/user_infos/user_infos_model.dart';
import 'package:observer_core/features/authentication/users/datas/services/user_infos_service.dart';
import 'package:observer_core/features/authentication/users/datas/sources/abstractions/abstract_user_infos_source.dart';

class UserInfosSource implements AbstractUserInfosSource {
  UserInfosSource({required this.userInfosService});
  final UserInfosService userInfosService;

  @override
  Future<UserInfosModel> getUserInfos() {
    return userInfosService.getUserInfos();
  }

  @override
  Future<void> postUserInfos(UserInfosModel userInfos) async {
    await userInfosService.storeUserInfos(userInfos: userInfos);
  }
}
