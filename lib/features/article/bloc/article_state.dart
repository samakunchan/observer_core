part of 'article_bloc.dart';

abstract class ArticleState extends Equatable {
  const ArticleState();
}

class ArticleInitial extends ArticleState {
  @override
  List<Object> get props => [];
}

class ArticleIsLoading extends ArticleState {
  @override
  List<Object> get props => [];
}

class ArticleIsNotLoaded extends ArticleState {
  const ArticleIsNotLoaded({this.message = ErrorMessage.noErrorMessageHandled});

  final String message;
  @override
  List<Object> get props => [message];
}

class ArticleShowOnGridMode extends ArticleState {
  const ArticleShowOnGridMode({this.articles = ArticleModel.emptyList});

  final List<ArticleModel> articles;
  @override
  List<Object> get props => [articles];
}

class ArticleShowOnListMode extends ArticleState {
  const ArticleShowOnListMode({this.articles = ArticleModel.emptyList});

  final List<ArticleModel> articles;
  @override
  List<Object> get props => [articles];
}

class ArticleIsRemovedSuccessfully extends ArticleState {
  @override
  List<Object> get props => [];
}

class ArticleIsNotRemoved extends ArticleState {
  @override
  List<Object> get props => [];
}
