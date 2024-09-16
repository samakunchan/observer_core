import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:observer_core/features/category/feature_category_export.dart';
import 'package:observer_core/models/models_export.dart';

class CategoriesSelector extends StatelessWidget {
  const CategoriesSelector({required this.builder, required this.onInit, super.key});
  final ValueChanged<CategoryModel> onInit;
  final Widget Function(BuildContext, List<CategoryModel>) builder;

  @override
  Widget build(BuildContext context) {
    return BlocSelector<CategoryBloc, CategoryState, List<CategoryModel>>(
      selector: _getListCategories,
      builder: builder,
    );
  }

  List<CategoryModel> _getListCategories(CategoryState state) {
    if (state is CategoriesAreLoadedSuccessfully) {
      final List<CategoryModel> categoryProjects =
          state.categories.where((CategoryModel category) => category.environment?.title == 'Portfolio').toList();
      onInit(categoryProjects.first);

      return categoryProjects;
    } else {
      return [];
    }
  }
}
