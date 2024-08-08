import 'package:json_annotation/json_annotation.dart';

part 'user_infos_model.g.dart';

abstract class AbstractUserInfosModel {
  const AbstractUserInfosModel({
    required this.sub,
    required this.siren,
    required this.emailVerified,
    required this.name,
    required this.preferredUsername,
    required this.locale,
    required this.givenName,
    required this.familyName,
    required this.email,
  });

  @JsonKey(name: 'sub')
  final String sub;

  @JsonKey(name: 'siren')
  final String siren;

  @JsonKey(name: 'email_verified')
  final bool emailVerified;

  @JsonKey(name: 'name')
  final String name;

  @JsonKey(name: 'preferred_username')
  final String preferredUsername;

  @JsonKey(name: 'locale')
  final String locale;

  @JsonKey(name: 'given_name')
  final String givenName;

  @JsonKey(name: 'family_name')
  final String familyName;

  @JsonKey(name: 'email')
  final String email;
}

@JsonSerializable()
class UserInfosModel extends AbstractUserInfosModel {
  const UserInfosModel({
    required super.sub,
    required super.siren,
    required super.emailVerified,
    required super.name,
    required super.preferredUsername,
    required super.locale,
    required super.givenName,
    required super.familyName,
    required super.email,
  });
  factory UserInfosModel.fromJson(Map<String, dynamic> json) => _$UserInfosModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserInfosModelToJson(this);
}

@JsonSerializable()
class FakeUserInfosModel extends AbstractUserInfosModel {
  const FakeUserInfosModel({
    required super.sub,
    required super.siren,
    required super.emailVerified,
    required super.name,
    required super.preferredUsername,
    required super.locale,
    required super.givenName,
    required super.familyName,
    required super.email,
  });

  factory FakeUserInfosModel.fromJson(Map<String, dynamic> json) => _$FakeUserInfosModelFromJson(json);

  static FakeUserInfosModel example = FakeUserInfosModel.fromJson({
    'sub': 'xxxx-xxxx-xxxx-xxxx-xxxxx',
    'siren': '999999999',
    'email_verified': true,
    'name': 'John Doe',
    'preferred_username': 'john-doe@fakemail.com',
    'locale': 'fr',
    'given_name': 'John',
    'family_name': 'Doe',
    'email': 'john-doe@fakemail.com',
  });

  Map<String, dynamic> toJson() => _$FakeUserInfosModelToJson(this);
}
