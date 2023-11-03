part of 'article_bloc.dart';

abstract class ArticleEvent extends Equatable {
  const ArticleEvent();
}

class ArticleInGridModeTriggered extends ArticleEvent {
  const ArticleInGridModeTriggered({this.articles = ArticleModel.emptyList});

  final List<ArticleModel> articles;
  @override
  List<Object?> get props => [articles];
}

class ArticleInListModeTriggered extends ArticleEvent {
  const ArticleInListModeTriggered({this.articles = ArticleModel.emptyList});

  final List<ArticleModel> articles;
  @override
  List<Object?> get props => [articles];
}

class ArticleSubmitted extends ArticleEvent {
  @override
  List<Object?> get props => [];
}

class ArticleDeleted extends ArticleEvent {
  @override
  List<Object?> get props => [];
}

class ArticleFiltered extends ArticleEvent {
  const ArticleFiltered({this.articles = ArticleModel.emptyList});

  final List<ArticleModel> articles;
  @override
  List<Object?> get props => [articles];
}
