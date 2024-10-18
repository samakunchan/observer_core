part of 'about_me_bloc.dart';

sealed class AboutMeEvent extends Equatable {
  const AboutMeEvent();
}

class AboutMeRequested extends AboutMeEvent {
  const AboutMeRequested();

  @override
  List<Object?> get props => [];
}

class AboutMeSubmitted extends AboutMeEvent {
  const AboutMeSubmitted({required this.aboutsDTO});

  final AboutsDTO aboutsDTO;

  @override
  List<Object?> get props => [aboutsDTO];
}
