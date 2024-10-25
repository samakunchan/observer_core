import 'dart:convert';

import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:observer_core/constantes.dart';
import 'package:observer_core/dtos/abouts/abouts_dto.dart';
import 'package:observer_core/features/features_export.dart';
import 'package:observer_core/models/models_export.dart';
import 'package:retrofit/retrofit.dart';

import '../../server_nestjs/data/fake_datas.dart';
import 'about_me_bloc_test.mocks.dart';

@GenerateMocks([AbstractServerNestjsRepository, AbstractAuthTokenSource])
void main() {
  late MockAbstractAuthTokenSource mockAbstractAuthTokenSource;
  late MockAbstractServerNestjsRepository mockAbstractServerNestjsRepository;
  late AuthTokenModel authTokenModel;

  /// Instanciation
  authTokenModel = fakeAuthToken;
  mockAbstractAuthTokenSource = MockAbstractAuthTokenSource();
  mockAbstractServerNestjsRepository = MockAbstractServerNestjsRepository();

  /// Création du stub pour les singletons
  GetIt.instance.registerSingleton<AbstractAuthTokenSource>(mockAbstractAuthTokenSource);
  GetIt.instance.registerSingleton<AbstractServerNestjsRepository>(mockAbstractServerNestjsRepository);

  /// Arrange token
  when(
    mockAbstractAuthTokenSource.getAuthToken(),
  ).thenAnswer(
    (_) => Future<AuthTokenModel>.value(authTokenModel),
  );

  group('AboutMeBloc', () {
    group('AboutMeRequested', () {
      blocTest<AboutMeBloc, AboutMeState>(
        'Request successful data.',
        build: AboutMeBloc.new,

        /// Arrange repository
        setUp: () {
          when(
            mockAbstractServerNestjsRepository.getResponses(
              GetParams(
                endPoint: MainProject.aboutme,
                accessToken: fakeAuthToken.accessToken,
              ),
            ),
          ).thenAnswer(
            (_) => Future<Either<Failure, HttpResponse<dynamic>>>.value(
              Right(
                HttpResponse(
                  [AboutMeModel.emptyDatas.toJson()],
                  Response(
                    requestOptions: RequestOptions(),
                    statusCode: 200,
                  ),
                ),
              ),
            ),
          );
        },

        /// Act
        act: (AboutMeBloc bloc) => bloc.add(const AboutMeRequested()),

        /// Assert
        expect: () => <AboutMeState>[
          AboutMeIsLoading(),
          const AboutMeIsLoadedSuccessfully(aboutMe: AboutMeModel.emptyDatas),
        ],
      );
    });

    group('AboutMeSubmitted', () {
      late AboutsDTO fakeDTO;

      blocTest<AboutMeBloc, AboutMeState>(
        'Upsert successful data.',
        build: AboutMeBloc.new,

        /// Arrange repository
        setUp: () {
          fakeDTO = AboutsDTO.fromJson(<String, dynamic>{
            'title': '',
            'content': '',
          });
          when(
            mockAbstractServerNestjsRepository.upsertOne(
              UpsertParams(
                endPoint: MainProject.aboutme,
                accessToken: fakeAuthToken.accessToken,
                body: jsonEncode(fakeDTO.toJson()),
              ),
            ),
          ).thenAnswer(
            (_) => Future<Either<Failure, HttpResponse<dynamic>>>.value(
              Right(
                HttpResponse(
                  AboutMeModel.emptyDatas.toJson(),
                  Response(
                    requestOptions: RequestOptions(),
                    statusCode: 200,
                  ),
                ),
              ),
            ),
          );
        },

        /// Act
        act: (AboutMeBloc bloc) => bloc.add(AboutMeSubmitted(aboutsDTO: fakeDTO)),

        /// Assert
        expect: () => <AboutMeState>[
          const AboutMeIsSubmittingSuccessfully(aboutMe: AboutMeModel.emptyDatas),
        ],
      );
    });
  });
}
