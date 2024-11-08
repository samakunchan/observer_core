import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:observer_core/features/features_export.dart';

class MockAuthTokenBloc extends MockBloc<AuthTokenEvent, AuthTokenState> implements AuthTokenBloc {}

@GenerateMocks([])
void main() {
  late MockAuthTokenBloc mockAuthTokenBloc;
  const String errorMessage = 'token invalid';

  group('Scenario of AuthTokenBloc', () {
    group('Given the fact the bloc is started.', () {
      group('When the bloc is in initial state.', () {
        setUp(() {
          mockAuthTokenBloc = MockAuthTokenBloc();
        });
        test('Then it should return [AuthTokenInitial] state.', () {
          /// Arrange
          whenListen(
            mockAuthTokenBloc,
            Stream.fromIterable([]),
            initialState: AuthTokenInitial(),
          );

          /// Act
          // no act

          /// Assert
          expect(mockAuthTokenBloc.state, equals(AuthTokenInitial()));
        });
      });
    });

    group('Given the fact a valid token is detected.', () {
      group('When event [AuthTokenValidDetected] is detected.', () {
        setUp(() {
          mockAuthTokenBloc = MockAuthTokenBloc();
        });

        test('Then it should have no props.', () {
          /// Arrange
          whenListen(
            mockAuthTokenBloc,
            Stream.fromIterable([AuthTokenInitial(), AuthTokenValid()]),
            initialState: AuthTokenInitial(),
          );

          /// Act
          const AuthTokenEvent authTokenEvent = AuthTokenValidDetected();
          mockAuthTokenBloc.add(authTokenEvent);

          /// Assert
          expect(authTokenEvent.props, equals([]));
        });
        blocTest<AuthTokenBloc, AuthTokenState>(
          'Then it should give a [AuthTokenValid] state.',
          build: AuthTokenBloc.new,

          /// Arrange repository
          setUp: () {},

          /// Act
          act: (AuthTokenBloc bloc) => bloc.add(const AuthTokenValidDetected()),

          /// Assert
          expect: () => <AuthTokenState>[
            AuthTokenValid(),
          ],
        );
      });
    });

    group('Given the fact an invalid token is detected.', () {
      group('When event [AuthTokenInValidDetected] is detected.', () {
        setUp(() {
          mockAuthTokenBloc = MockAuthTokenBloc();
        });

        test('Then the props should contain an error message', () {
          /// Arrange
          whenListen(
            mockAuthTokenBloc,
            Stream.fromIterable([AuthTokenInitial(), const AuthTokenInvalid(message: errorMessage)]),
            initialState: AuthTokenInitial(),
          );

          /// Act
          const AuthTokenEvent authTokenEvent = AuthTokenInValidDetected(message: errorMessage);
          mockAuthTokenBloc.add(authTokenEvent);

          /// Assert
          expect(authTokenEvent.props, equals([errorMessage]));
        });
        blocTest<AuthTokenBloc, AuthTokenState>(
          'Then it should give a [AuthTokenInvalid] state.',
          build: AuthTokenBloc.new,

          /// Arrange repository
          setUp: () {},

          /// Act
          act: (AuthTokenBloc bloc) => bloc.add(const AuthTokenInValidDetected(message: 'token invalid')),

          /// Assert
          expect: () => <AuthTokenState>[
            const AuthTokenInvalid(message: 'token invalid'),
          ],
        );
      });
    });
  });
}
