import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:observer_core/features/category/bloc/category_bloc.dart';

class CategoriesServerOfflineSelector extends StatelessWidget {
  const CategoriesServerOfflineSelector({required this.builder, super.key});
  final Widget Function(BuildContext, bool) builder;

  @override
  Widget build(BuildContext context) {
    return BlocSelector<CategoryBloc, CategoryState, bool>(
      selector: whenWeLoadCategoriesFromLocal,
      builder: builder,
    );
  }

  static bool whenWeLoadCategoriesFromLocal(CategoryState state) => state is CategoriesInMemoryAreLoadedSuccessfully;
}
