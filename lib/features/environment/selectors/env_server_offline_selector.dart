import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:observer_core/constantes.dart';
import 'package:observer_core/features/environment/feature_environment_export.dart';

class EnvServerOfflineSelector extends StatelessWidget {
  const EnvServerOfflineSelector({required this.builder, super.key});
  final Widget Function(BuildContext, bool) builder;

  @override
  Widget build(BuildContext context) {
    return BlocSelector<EnvironmentStoreBloc, EnvironmentStoreState, bool>(
      selector: whenWeLoadEnvironmentsStoreFromLocal,
      builder: builder,
    );
  }

  static bool whenWeLoadEnvironmentsStoreFromLocal(EnvironmentStoreState state) =>
      state is EnvironmentsStoreIsClosed && state.message == ErrorMessage.serverFailureMessage ||
      (state is EnvironmentsStoreIsOpenInMemory);
}
