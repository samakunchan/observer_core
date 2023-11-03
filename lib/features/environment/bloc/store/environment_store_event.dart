part of 'environment_store_bloc.dart';

abstract class EnvironmentStoreEvent extends Equatable {
  const EnvironmentStoreEvent();
}

class EnvironmentsStoreTriggered extends EnvironmentStoreEvent {
  const EnvironmentsStoreTriggered({this.environments = EnvironmentModel.emptyList, this.isFetchingApi = true});

  final List<EnvironmentModel> environments;
  final bool isFetchingApi;

  @override
  List<Object?> get props => [environments, isFetchingApi];
}

class EnvironmentsStoreInMemoryTriggered extends EnvironmentStoreEvent {
  const EnvironmentsStoreInMemoryTriggered({this.environments = EnvironmentModel.emptyList, this.isFetchingApi = true});

  final List<EnvironmentModel> environments;
  final bool isFetchingApi;

  @override
  List<Object?> get props => [environments, isFetchingApi];
}

class EnvironmentsStoreReloaded extends EnvironmentStoreEvent {
  @override
  List<Object?> get props => [];
}
