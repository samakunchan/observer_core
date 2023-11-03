part of 'category_bloc.dart';

abstract class CategoryState extends Equatable {
  const CategoryState();
}

class CategoryInitial extends CategoryState {
  @override
  List<Object> get props => [];
}

class CategoryIsLoading extends CategoryState {
  @override
  List<Object> get props => [];
}

class CategoriesAreLoadedSuccessfully extends CategoryState {
  const CategoriesAreLoadedSuccessfully({
    required this.selectedId,
    this.categories = CategoryModel.emptyList,
    this.screenMode = ScreenMode.grid,
  });
  final ScreenMode screenMode;
  final List<CategoryModel> categories;
  final int selectedId;

  @override
  List<Object> get props => [categories, selectedId];
}

class CategoriesAreFilteredSuccessfully extends CategoryState {
  const CategoriesAreFilteredSuccessfully({
    this.categories = CategoryModel.emptyList,
    this.filteredCategories = CategoryModel.emptyList,
    this.screenMode = ScreenMode.grid,
  });
  final ScreenMode screenMode;
  final List<CategoryModel> categories;
  final List<CategoryModel> filteredCategories;

  @override
  List<Object> get props => [categories, filteredCategories];
}

class CategoriesInMemoryAreLoadedSuccessfully extends CategoryState {
  const CategoriesInMemoryAreLoadedSuccessfully({
    this.categories = CategoryModel.emptyList,
    this.screenMode = ScreenMode.grid,
  });

  final List<CategoryModel> categories;
  final ScreenMode screenMode;

  @override
  List<Object> get props => [categories, screenMode];
}

class CategoriesInMemoryAreFilteredSuccessfully extends CategoryState {
  const CategoriesInMemoryAreFilteredSuccessfully({
    this.categories = CategoryModel.emptyList,
    this.screenMode = ScreenMode.grid,
  });

  final List<CategoryModel> categories;
  final ScreenMode screenMode;

  @override
  List<Object> get props => [categories, screenMode];
}

class CategoriesAreNotLoaded extends CategoryState {
  const CategoriesAreNotLoaded({this.message = ErrorMessage.noErrorMessageHandled});

  /// Tout les messages d'érreurs:
  /// - [ErrorMessage.noErrorMessageHandled]
  /// - [ErrorMessage.networkOfflineMessage]
  /// - [ErrorMessage.serverFailureMessage]
  /// - [ErrorMessage.cacheFailureMessage]
  /// - [ErrorMessage.notFoundMessage]
  /// - [ErrorMessage.unAuthorizationMessage]
  /// - [ErrorMessage.forbiddenMessage]
  final String message;

  @override
  List<Object> get props => [message];
}

class CategoriesAreReLoadedSuccessfully extends CategoryState {
  const CategoriesAreReLoadedSuccessfully({this.categories = CategoryModel.emptyList});

  final List<CategoryModel> categories;

  @override
  List<Object> get props => [categories];
}

class CategoryIsRemovedSuccessfully extends CategoryState {
  @override
  List<Object> get props => [];
}

class CategoryIsNotRemoved extends CategoryState {
  @override
  List<Object> get props => [];
}

class CategoryFormIsSubmitting extends CategoryState {
  @override
  List<Object> get props => [];
}

class CategoryFormIsSubmittedSuccessfully extends CategoryState {
  @override
  List<Object> get props => [];
}
