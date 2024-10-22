part of 'about_me_bloc.dart';

abstract class AboutMeState extends Equatable {
  const AboutMeState();
}

final class AboutMeInitial extends AboutMeState {
  @override
  List<Object> get props => [];
}

final class AboutMeIsLoading extends AboutMeState {
  @override
  List<Object> get props => [];
}

final class AboutMeIsLoadedSuccessfully extends AboutMeState {
  const AboutMeIsLoadedSuccessfully({required this.aboutMe});

  final AboutMeModel aboutMe;

  @override
  List<Object> get props => [aboutMe];
}

final class AboutMeIsSubmitting extends AboutMeState {
  @override
  List<Object> get props => [];
}

final class AboutMeIsSubmittingSuccessfully extends AboutMeState {
  const AboutMeIsSubmittingSuccessfully({required this.aboutMe});

  final AboutMeModel aboutMe;

  @override
  List<Object> get props => [aboutMe];
}

final class AboutMeHasFailure extends AboutMeState {
  const AboutMeHasFailure({this.message = ErrorMessage.noErrorMessageHandled});

  /// Tout les messages d'érreurs:
  /// - [ErrorMessage.noErrorMessageHandled]
  /// - [ErrorMessage.networkOfflineMessage]
  /// - [ErrorMessage.serverFailureMessage]
  /// - [ErrorMessage.cacheFailureMessage]
  /// - [ErrorMessage.notFoundMessage]
  /// - [ErrorMessage.unAuthorizationMessage]
  /// - [ErrorMessage.forbiddenMessage]
  final String message;

  @override
  List<Object?> get props => [message];
}
