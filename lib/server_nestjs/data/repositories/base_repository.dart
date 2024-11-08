import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:observer_core/server_nestjs/feature_server_nestjs_export.dart';

class BaseRepository {
  /// Méthode qui va exécuter le callback de l'[ServerNestjsSource]. <br>
  /// Elle retourne les exceptions suivantes: <br>
  /// - ServerException
  /// - NotFoundFailure
  /// - UnAuthorizedException
  /// - ForbiddenException
  /// - IDontKnowWhatImDoingException
  ///
  /// Return: <br>
  /// - [Right] => Success
  /// - [Left] => Failure
  static Future<Either<Failure, T>> requestRemoteApi<T>(Future<T> Function() getConcrete) async {
    try {
      final T remote = await getConcrete();

      return Right(remote);
    } on ServerException {
      return const Left(ServerFailure());
    } on BadRequestException catch (e) {
      return Left(BadRequestFailure(message: e.httpError.description));
    } on NotFoundException catch (e) {
      return Left(NotFoundFailure(message: e.httpError.description));
    } on UnAuthorizedException catch (e) {
      if (e.httpError.description.isNotEmpty) {
        return Left(UnAuthorizedFailure(message: e.httpError.description));
      } else {
        return const Left(UnAuthorizedFailure());
      }
    } on ForbiddenException catch (e) {
      if (e.httpError.description.isNotEmpty) {
        return Left(ForbiddenFailure(message: e.httpError.description));
      } else {
        return const Left(ForbiddenFailure());
      }
    } on DioException catch (e) {
      return Left(BadRequestFailure(message: e.message ?? ''));
    } on IDontKnowWhatImDoingException {
      return Left(IDontKnowWhatImDoingFailure());
    } catch (e) {
      return Left(NothingWorkDoingFailure());
    }
  }

  static Future<Either<Failure, T>> requestInMemoryStorage<T>(Future<T> Function() getConcrete) async {
    try {
      final T remote = await getConcrete();
      return Right(remote);
    } on ServerException {
      return const Left(ServerFailure());
    } on BadRequestException catch (e) {
      return Left(BadRequestFailure(message: e.httpError.description));
    } on NotFoundException {
      return const Left(NotFoundFailure());
    } on UnAuthorizedException catch (e) {
      if (e.httpError.description.isNotEmpty) {
        return Left(UnAuthorizedFailure(message: e.httpError.description));
      } else {
        return const Left(UnAuthorizedFailure());
      }
    } on ForbiddenException catch (e) {
      return Left(ForbiddenFailure(message: e.httpError.description));
    } on DioException catch (e) {
      return Left(BadRequestFailure(message: e.message ?? ''));
    } on IDontKnowWhatImDoingException {
      return Left(IDontKnowWhatImDoingFailure());
    } catch (e) {
      return Left(NothingWorkDoingFailure());
    }
  }
}
