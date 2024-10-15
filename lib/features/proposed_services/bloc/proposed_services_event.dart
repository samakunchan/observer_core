part of 'proposed_services_bloc.dart';

abstract class ProposedServicesEvent extends Equatable {
  const ProposedServicesEvent();
}

class ProposedServicesRequested extends ProposedServicesEvent {
  const ProposedServicesRequested();

  @override
  List<Object?> get props => [];
}

class ProposedServiceSubmitted extends ProposedServicesEvent {
  const ProposedServiceSubmitted({required this.proposedServiceDTO});

  final ProposedServiceDTO proposedServiceDTO;

  @override
  List<Object?> get props => [proposedServiceDTO];
}

class ProposedServiceDeleted extends ProposedServicesEvent {
  const ProposedServiceDeleted({required this.id});

  final int id;

  @override
  List<Object?> get props => [id];
}
