part of 'category_bloc.dart';

abstract class CategoryEvent extends Equatable {
  const CategoryEvent();
}

class CategoriesInitialized extends CategoryEvent {
  @override
  List<Object?> get props => [];
}

class CategoriesInGridTriggeredInMemory extends CategoryEvent {
  const CategoriesInGridTriggeredInMemory({this.categories = CategoryModel.emptyList, this.isFetchingApi = true});

  final List<CategoryModel> categories;
  final bool isFetchingApi;

  @override
  List<Object?> get props => [categories, isFetchingApi];
}

class CategoriesInGridTriggered extends CategoryEvent {
  const CategoriesInGridTriggered({this.categories = CategoryModel.emptyList, this.isFetchingApi = true});

  final List<CategoryModel> categories;
  final bool isFetchingApi;

  @override
  List<Object?> get props => [categories, isFetchingApi];
}

class CategoriesInListTriggeredInMemory extends CategoryEvent {
  const CategoriesInListTriggeredInMemory({this.categories = CategoryModel.emptyList, this.isFetchingApi = true});

  final List<CategoryModel> categories;
  final bool isFetchingApi;

  @override
  List<Object?> get props => [categories, isFetchingApi];
}

class CategoriesInListTriggered extends CategoryEvent {
  const CategoriesInListTriggered({this.categories = CategoryModel.emptyList, this.isFetchingApi = true});

  final List<CategoryModel> categories;
  final bool isFetchingApi;

  @override
  List<Object?> get props => [categories, isFetchingApi];
}

class CategoriesReloaded extends CategoryEvent {
  @override
  List<Object?> get props => [];
}

class CategorySubmitted extends CategoryEvent {
  const CategorySubmitted({required this.categoryForUpsert});
  final CategoryUpsertDto categoryForUpsert;

  @override
  List<Object?> get props => [categoryForUpsert];
}

class CategoryDeleted extends CategoryEvent {
  @override
  List<Object?> get props => [];
}

class CategoryFiltered extends CategoryEvent {
  const CategoryFiltered({
    required this.categories,
    required this.filterInText,
    this.filteredCategories = CategoryModel.emptyList,
    this.screenMode = ScreenMode.grid,
  });
  final List<CategoryModel> filteredCategories;
  final List<CategoryModel> categories;
  final String filterInText;
  final ScreenMode screenMode;

  @override
  List<Object?> get props => [categories, filterInText, screenMode];
}
