abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthAuthenticated extends AuthState {
  final String firstName;
  AuthAuthenticated(this.firstName);
}

class AuthUnauthenticated extends AuthState {}
