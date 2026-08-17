import 'package:ex2/core/storage/share_preferences.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthLocalStorage _storage;

  AuthCubit(this._storage) : super(AuthInitial());

  Future<void> checkAuth() async {
    final firstName = await _storage.getFirstName();
    if (firstName != null && firstName.isNotEmpty) {
      emit(AuthAuthenticated(firstName));
    } else {
      emit(AuthUnauthenticated());
    }
  }

  Future<void> enter(String firstName) async {
    await _storage.saveFirstName(firstName.trim());
    emit(AuthAuthenticated(firstName.trim()));
  }

  Future<void> logout() async {
    await _storage.clear();
    emit(AuthUnauthenticated());
  }
}
