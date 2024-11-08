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
    this.filteredCategories = CategoryModel.emptyList,
    this.screenMode = ScreenMode.grid,
  });
  final ScreenMode screenMode;
  final List<CategoryModel> categories;
  final int selectedId;
  final List<CategoryModel> filteredCategories;

  @override
  List<Object> get props => [categories, selectedId, filteredCategories];
}

class CategoriesAreFilteredSuccessfully extends CategoryState {
  const CategoriesAreFilteredSuccessfully({
    required this.selectedId,
    this.categories = CategoryModel.emptyList,
    this.filteredCategories = CategoryModel.emptyList,
    this.screenMode = ScreenMode.grid,
  });
  final ScreenMode screenMode;
  final List<CategoryModel> categories;
  final List<CategoryModel> filteredCategories;
  final int selectedId;

  @override
  List<Object> get props => [categories, selectedId, filteredCategories];
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
//
// class CategoriesInMemoryAreFilteredSuccessfully extends CategoryState {
//   const CategoriesInMemoryAreFilteredSuccessfully({
//     this.categories = CategoryModel.emptyList,
//     this.screenMode = ScreenMode.grid,
//   });
//
//   final List<CategoryModel> categories;
//   final ScreenMode screenMode;
//
//   @override
//   List<Object> get props => [categories, screenMode];
// }

class CategoriesHaveFailures extends CategoryState {
  const CategoriesHaveFailures({this.message = ErrorMessage.noErrorMessageHandled});

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

// class CategoryFormIsSubmitting extends CategoryState {
//   @override
//   List<Object> get props => [];
// }

class CategoryFormIsSubmittedSuccessfully extends CategoryState {
  @override
  List<Object> get props => [];
}

// class CategoriesAreSearchSuccessfully extends CategoryState {
//   const CategoriesAreSearchSuccessfully({required this.searchModel});
//
//   final SearchModel searchModel;
//
//   @override
//   List<Object> get props => [searchModel];
// }

class CategoryIsDeletedSuccessfully extends CategoryState {
  const CategoryIsDeletedSuccessfully({required this.categoryDeleted});

  final CategoryModel categoryDeleted;

  @override
  List<Object> get props => [categoryDeleted];
}
