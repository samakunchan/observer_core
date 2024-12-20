// Mocks generated by Mockito 5.4.4 from annotations
// in observer_core/test/features/authentication/tokens/datas/sources/auth_token_source_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:mockito/mockito.dart' as _i1;
import 'package:observer_core/features/authentication/tokens/datas/models/models_export.dart'
    as _i2;
import 'package:observer_core/features/authentication/tokens/datas/services/auth_token_service.dart'
    as _i3;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeAuthTokenModel_0 extends _i1.SmartFake
    implements _i2.AuthTokenModel {
  _FakeAuthTokenModel_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [AuthTokenService].
///
/// See the documentation for Mockito's code generation for more information.
class MockAuthTokenService extends _i1.Mock implements _i3.AuthTokenService {
  MockAuthTokenService() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<void> storeAuthToken({required _i2.AuthTokenModel? authToken}) =>
      (super.noSuchMethod(
        Invocation.method(
          #storeAuthToken,
          [],
          {#authToken: authToken},
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);

  @override
  _i4.Future<_i2.AuthTokenModel> getAuthToken() => (super.noSuchMethod(
        Invocation.method(
          #getAuthToken,
          [],
        ),
        returnValue: _i4.Future<_i2.AuthTokenModel>.value(_FakeAuthTokenModel_0(
          this,
          Invocation.method(
            #getAuthToken,
            [],
          ),
        )),
      ) as _i4.Future<_i2.AuthTokenModel>);
}
