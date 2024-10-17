part of 'reason_bloc.dart';

sealed class ReasonEvent extends Equatable {
  const ReasonEvent();
}

class ReasonsRequested extends ReasonEvent {
  const ReasonsRequested();

  @override
  List<Object?> get props => [];
}

class ReasonsUpdated extends ReasonEvent {
  const ReasonsUpdated({required this.reasons});

  final List<ReasonModel> reasons;

  @override
  List<Object?> get props => [reasons];
}

class ReasonSubmitted extends ReasonEvent {
  const ReasonSubmitted({required this.reasonsDTO});

  final ReasonsDTO reasonsDTO;

  @override
  List<Object?> get props => [reasonsDTO];
}

class ReasonDeleted extends ReasonEvent {
  const ReasonDeleted({required this.id});

  final int id;

  @override
  List<Object?> get props => [id];
}
