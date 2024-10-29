part of 'category_bloc.dart';

abstract class CategoryEvent extends Equatable {
  const CategoryEvent();
}

class CategoriesInitialized extends CategoryEvent {
  @override
  List<Object?> get props => [];
}

class CategoriesInGridRequestedInMemory extends CategoryEvent {
  const CategoriesInGridRequestedInMemory({
    this.categories = CategoryModel.emptyList,
  });

  final List<CategoryModel> categories;

  @override
  List<Object?> get props => [categories];
}

class CategoriesInGridRequested extends CategoryEvent {
  const CategoriesInGridRequested({
    this.categories = CategoryModel.emptyList,
  });

  final List<CategoryModel> categories;

  @override
  List<Object?> get props => [categories];
}

class CategoriesInListRequestedInMemory extends CategoryEvent {
  const CategoriesInListRequestedInMemory({
    this.categories = CategoryModel.emptyList,
  });

  final List<CategoryModel> categories;

  @override
  List<Object?> get props => [categories];
}

class CategoriesInListRequested extends CategoryEvent {
  const CategoriesInListRequested({
    this.categories = CategoryModel.emptyList,
  });

  final List<CategoryModel> categories;

  @override
  List<Object?> get props => [categories];
}

class CategoriesReloaded extends CategoryEvent {
  @override
  List<Object?> get props => [];
}

class CategorySubmitted extends CategoryEvent {
  const CategorySubmitted({required this.categoryForUpsert});
  final CategoryUpsertDTO categoryForUpsert;

  @override
  List<Object?> get props => [categoryForUpsert];
}

class CategoryDeleted extends CategoryEvent {
  const CategoryDeleted({required this.categoryForDelete});

  final CategoryModel categoryForDelete;

  @override
  List<Object?> get props => [categoryForDelete];
}

class CategoryFiltered extends CategoryEvent {
  const CategoryFiltered({
    required this.selectedId,
    required this.categories,
    required this.filterInText,
    this.filteredCategories = CategoryModel.emptyList,
    this.screenMode = ScreenMode.grid,
  });
  final List<CategoryModel> filteredCategories;
  final List<CategoryModel> categories;
  final String filterInText;
  final ScreenMode screenMode;
  final int selectedId;

  @override
  List<Object?> get props => [categories, filterInText, screenMode];
}

class CategorySelected extends CategoryEvent {
  const CategorySelected({
    required this.categories,
    required this.filterId,
    this.filteredCategories = CategoryModel.emptyList,
  });
  final List<CategoryModel> filteredCategories;
  final List<CategoryModel> categories;
  final int filterId;

  @override
  List<Object?> get props => [categories, filterId];
}

// class CategoriesOnSearch extends CategoryEvent {
//   const CategoriesOnSearch({required this.input, this.strictMode = false});
//   final String input;
//   final bool strictMode;
//
//   @override
//   List<Object?> get props => [input];
// }
