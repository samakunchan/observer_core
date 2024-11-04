// Mocks generated by Mockito 5.4.4 from annotations
// in observer_core/test/features/skill/bloc/skill_bloc_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i5;

import 'package:dartz/dartz.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;
import 'package:observer_core/features/authentication/tokens/datas/models/auth_token/auth_token_model.dart'
    as _i3;
import 'package:observer_core/features/authentication/tokens/datas/sources/abstractions/abstract_auth_token_source.dart'
    as _i7;
import 'package:observer_core/server_nestjs/feature_server_nestjs_export.dart'
    as _i4;
import 'package:retrofit/dio.dart' as _i6;

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

class _FakeEither_0<L, R> extends _i1.SmartFake implements _i2.Either<L, R> {
  _FakeEither_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeAuthTokenModel_1 extends _i1.SmartFake
    implements _i3.AuthTokenModel {
  _FakeAuthTokenModel_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [AbstractServerNestjsRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockAbstractServerNestjsRepository extends _i1.Mock
    implements _i4.AbstractServerNestjsRepository {
  MockAbstractServerNestjsRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Future<_i2.Either<_i4.Failure, _i6.HttpResponse<dynamic>>> getResponses(
          _i4.GetParams? params) =>
      (super.noSuchMethod(
        Invocation.method(
          #getResponses,
          [params],
        ),
        returnValue: _i5
            .Future<_i2.Either<_i4.Failure, _i6.HttpResponse<dynamic>>>.value(
            _FakeEither_0<_i4.Failure, _i6.HttpResponse<dynamic>>(
          this,
          Invocation.method(
            #getResponses,
            [params],
          ),
        )),
      ) as _i5.Future<_i2.Either<_i4.Failure, _i6.HttpResponse<dynamic>>>);

  @override
  _i5.Future<_i2.Either<_i4.Failure, _i6.HttpResponse<dynamic>>> upsertOne(
          _i4.UpsertParams? params) =>
      (super.noSuchMethod(
        Invocation.method(
          #upsertOne,
          [params],
        ),
        returnValue: _i5
            .Future<_i2.Either<_i4.Failure, _i6.HttpResponse<dynamic>>>.value(
            _FakeEither_0<_i4.Failure, _i6.HttpResponse<dynamic>>(
          this,
          Invocation.method(
            #upsertOne,
            [params],
          ),
        )),
      ) as _i5.Future<_i2.Either<_i4.Failure, _i6.HttpResponse<dynamic>>>);

  @override
  _i5.Future<_i2.Either<_i4.Failure, _i6.HttpResponse<dynamic>>> uploadFormData(
          _i4.UploadFormDataParams? params) =>
      (super.noSuchMethod(
        Invocation.method(
          #uploadFormData,
          [params],
        ),
        returnValue: _i5
            .Future<_i2.Either<_i4.Failure, _i6.HttpResponse<dynamic>>>.value(
            _FakeEither_0<_i4.Failure, _i6.HttpResponse<dynamic>>(
          this,
          Invocation.method(
            #uploadFormData,
            [params],
          ),
        )),
      ) as _i5.Future<_i2.Either<_i4.Failure, _i6.HttpResponse<dynamic>>>);

  @override
  _i5.Future<_i2.Either<_i4.Failure, _i6.HttpResponse<dynamic>>> deleteOne(
          _i4.DeleteParams? params) =>
      (super.noSuchMethod(
        Invocation.method(
          #deleteOne,
          [params],
        ),
        returnValue: _i5
            .Future<_i2.Either<_i4.Failure, _i6.HttpResponse<dynamic>>>.value(
            _FakeEither_0<_i4.Failure, _i6.HttpResponse<dynamic>>(
          this,
          Invocation.method(
            #deleteOne,
            [params],
          ),
        )),
      ) as _i5.Future<_i2.Either<_i4.Failure, _i6.HttpResponse<dynamic>>>);

  @override
  _i5.Future<_i2.Either<_i4.Failure, _i6.HttpResponse<dynamic>>> search(
          _i4.SearchParams? params) =>
      (super.noSuchMethod(
        Invocation.method(
          #search,
          [params],
        ),
        returnValue: _i5
            .Future<_i2.Either<_i4.Failure, _i6.HttpResponse<dynamic>>>.value(
            _FakeEither_0<_i4.Failure, _i6.HttpResponse<dynamic>>(
          this,
          Invocation.method(
            #search,
            [params],
          ),
        )),
      ) as _i5.Future<_i2.Either<_i4.Failure, _i6.HttpResponse<dynamic>>>);
}

/// A class which mocks [AbstractAuthTokenSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockAbstractAuthTokenSource extends _i1.Mock
    implements _i7.AbstractAuthTokenSource {
  MockAbstractAuthTokenSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Future<_i3.AuthTokenModel> getAuthToken() => (super.noSuchMethod(
        Invocation.method(
          #getAuthToken,
          [],
        ),
        returnValue: _i5.Future<_i3.AuthTokenModel>.value(_FakeAuthTokenModel_1(
          this,
          Invocation.method(
            #getAuthToken,
            [],
          ),
        )),
      ) as _i5.Future<_i3.AuthTokenModel>);

  @override
  _i5.Future<void> postAuthToken(_i3.AuthTokenModel? authToken) =>
      (super.noSuchMethod(
        Invocation.method(
          #postAuthToken,
          [authToken],
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);
}
