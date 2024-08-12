import 'package:json_annotation/json_annotation.dart';

part 'auth_token_model.g.dart';

abstract class AbstractAuthTokenModel {
  const AbstractAuthTokenModel({
    required this.accessToken,
    required this.expiresIn,
    required this.refreshToken,
    required this.tokenType,
    required this.idToken,
    required this.notBeforePolicy,
    required this.sessionState,
    required this.scope,
  });
  @JsonKey(name: 'access_token')
  final String accessToken;

  @JsonKey(name: 'expires_in')
  final int expiresIn;

  @JsonKey(name: 'refresh_token')
  final String refreshToken;

  @JsonKey(name: 'token_type')
  final String tokenType;

  @JsonKey(name: 'id_token')
  final String idToken;

  @JsonKey(name: 'not-before-policy')
  final int notBeforePolicy;

  @JsonKey(name: 'session_state')
  final String sessionState;

  @JsonKey(name: 'scope')
  final String scope;
}

@JsonSerializable()
class AuthTokenModel extends AbstractAuthTokenModel {
  const AuthTokenModel({
    required super.accessToken,
    required super.expiresIn,
    required super.refreshToken,
    required super.tokenType,
    required super.idToken,
    required super.notBeforePolicy,
    required super.sessionState,
    required super.scope,
  });

  factory AuthTokenModel.fromJson(Map<String, dynamic> json) => _$AuthTokenModelFromJson(json);

  Map<String, dynamic> toJson() => _$AuthTokenModelToJson(this);
}

@JsonSerializable()
class FakeAuthTokenModel extends AbstractAuthTokenModel {
  const FakeAuthTokenModel({
    required super.accessToken,
    required super.expiresIn,
    required super.refreshToken,
    required super.tokenType,
    required super.idToken,
    required super.notBeforePolicy,
    required super.sessionState,
    required super.scope,
  });

  factory FakeAuthTokenModel.fromJson(Map<String, dynamic> json) => _$FakeAuthTokenModelFromJson(json);

  static FakeAuthTokenModel example = FakeAuthTokenModel.fromJson(<String, dynamic>{
    'access_token': 'fake-access-token',
    'expires_in': 300,
    'refresh_token': 'fake-refresh-token',
    'token_type': 'Bearer',
    'id_token': 'fake-id-token',
    'not-before-policy': 0,
    'session_state': 'fake-session-state',
    'scope': 'fake-scope1 fake-scope2 fake-scope3',
  });

  Map<String, dynamic> toJson() => _$FakeAuthTokenModelToJson(this);
}
