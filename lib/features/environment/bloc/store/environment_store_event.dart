part of 'environment_store_bloc.dart';

abstract class EnvironmentStoreEvent extends Equatable {
  const EnvironmentStoreEvent();
}

class EnvironmentsStoreRequested extends EnvironmentStoreEvent {
  const EnvironmentsStoreRequested({this.environments = EnvironmentModel.emptyList, this.isFetchingApi = true});

  final List<EnvironmentModel> environments;
  final bool isFetchingApi;

  @override
  List<Object?> get props => [environments, isFetchingApi];
}

class EnvironmentsStoreInMemoryRequested extends EnvironmentStoreEvent {
  const EnvironmentsStoreInMemoryRequested({this.environments = EnvironmentModel.emptyList, this.isFetchingApi = true});

  final List<EnvironmentModel> environments;
  final bool isFetchingApi;

  @override
  List<Object?> get props => [environments, isFetchingApi];
}

class EnvironmentsStoreReloaded extends EnvironmentStoreEvent {
  @override
  List<Object?> get props => [];
}
