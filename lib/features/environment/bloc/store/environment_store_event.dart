part of 'environment_store_bloc.dart';

abstract class EnvironmentStoreEvent extends Equatable {
  const EnvironmentStoreEvent();
}

class EnvironmentsStoreRequested extends EnvironmentStoreEvent {
  const EnvironmentsStoreRequested({this.environments = EnvironmentModel.emptyList});

  final List<EnvironmentModel> environments;

  @override
  List<Object?> get props => [environments];
}

class EnvironmentsStoreInMemoryRequested extends EnvironmentStoreEvent {
  const EnvironmentsStoreInMemoryRequested({this.environments = EnvironmentModel.emptyList});

  final List<EnvironmentModel> environments;

  @override
  List<Object?> get props => [environments];
}

class EnvironmentsStoreReloaded extends EnvironmentStoreEvent {
  @override
  List<Object?> get props => [];
}
