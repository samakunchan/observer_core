part of 'skill_bloc.dart';

sealed class SkillEvent extends Equatable {
  const SkillEvent();
}

class SkillsRequested extends SkillEvent {
  const SkillsRequested();

  @override
  List<Object?> get props => [];
}

class SkillsUpdated extends SkillEvent {
  const SkillsUpdated({required this.skills});

  final List<SkillModel> skills;

  @override
  List<Object?> get props => [skills];
}

class SkillSubmitted extends SkillEvent {
  const SkillSubmitted({required this.skillsDTO});

  final SkillsDTO skillsDTO;

  @override
  List<Object?> get props => [skillsDTO];
}

class SkillDeleted extends SkillEvent {
  const SkillDeleted({required this.id});

  final int id;

  @override
  List<Object?> get props => [id];
}
