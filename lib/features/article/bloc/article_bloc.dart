import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:observer_core/constantes.dart';
import 'package:observer_core/features/features_export.dart';
import 'package:observer_core/models/models_export.dart';
import 'package:retrofit/dio.dart';

part 'article_event.dart';
part 'article_state.dart';

class ArticleBloc extends Bloc<ArticleEvent, ArticleState> {
  ArticleBloc() : super(ArticleInitial()) {
    on<ArticleInGridModeTriggered>(_showArticleInGridMode);
    on<ArticleInListModeTriggered>(_showArticleInListMode);
    on<ArticleDeleted>(_deleteArticle);
    on<ArticleFiltered>(_filterArticle);
  }

  Future<void> _showArticleInGridMode(ArticleInGridModeTriggered event, Emitter<ArticleState> emit) async {
    final Either<Failure, HttpResponse<dynamic>> responses = await ServerFeature.instanceOfPPGApiRepository.getResponses(
      const GetParams(endPoint: MainProject.categoriesEndPoint, accessToken: accessToken),
    );
    switch (responses) {
      case Left():
        responses.fold((Failure failure) => _handleAllFailures(failure: failure, emit: emit), (HttpResponse<dynamic> response) => null);
      case Right():
        responses.fold((Failure failure) => null, (HttpResponse<dynamic> response) {
          final List<Map<String, dynamic>> datasJson = (response.data as List<dynamic>).map((e) => e as Map<String, dynamic>).toList();
          final List<ArticleModel> articles = datasJson.map<ArticleModel>(ArticleModel.fromJson).toList();
          emit.call(ArticleShowOnGridMode(articles: articles));
        });
      default:
        emit.call(ArticleIsLoading());
    }
  }

  Future<void> _showArticleInListMode(ArticleInListModeTriggered event, Emitter<ArticleState> emit) async {
    emit.call(ArticleShowOnListMode(articles: event.articles));
  }

  Future<void> _deleteArticle(ArticleDeleted event, Emitter<ArticleState> emit) async {
    emit.call(ArticleIsRemovedSuccessfully());
  }

  Future<void> _filterArticle(ArticleFiltered event, Emitter<ArticleState> emit) async {
    emit.call(ArticleShowOnListMode(articles: event.articles));
  }

  void _handleAllFailures({required Failure failure, required Emitter<ArticleState> emit}) {
    switch (failure) {
      case ServerFailure():
        return emit.call(ArticleIsNotLoaded(message: failure.message));
      case CacheFailure():
        return emit.call(ArticleIsNotLoaded(message: failure.message));
      case NetworkFailure():
        return emit.call(ArticleIsNotLoaded(message: failure.message));
      case NotFoundFailure():
        return emit.call(ArticleIsNotLoaded(message: failure.message));
      case UnAuthorizedFailure():
        return emit.call(ArticleIsNotLoaded(message: failure.message));
      case ForbiddenFailure():
        return emit.call(ArticleIsNotLoaded(message: failure.message));
      case IDontKnowWhatImDoingFailure():
        return emit.call(const ArticleIsNotLoaded());
      default:
        return emit.call(ArticleIsLoading());
    }
  }
}
