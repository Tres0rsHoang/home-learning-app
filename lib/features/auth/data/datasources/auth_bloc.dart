import 'package:donuts_app/features/auth/data/repositories/auth_repository_iml.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginData {
  String? username;
  String? password;

  LoginData({this.username, this.password});

  @override
  String toString() {
    return "username: $username, password: $password";
  }
}

class AuthState {
  final bool isLoading;
  final bool isAuthenticated;
  final bool isChecking;

  final String? error;

  AuthState({
    this.isChecking = true,
    this.isLoading = false,
    this.isAuthenticated = false,
    this.error,
  });

  AuthState copyWith({
    bool? isChecking,
    bool? isLoading,
    bool? isAuthenticated,
    String? error,
  }) {
    return AuthState(
      isChecking: isChecking ?? this.isChecking,
      isLoading: isLoading ?? this.isLoading,
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
      error: error,
    );
  }
}

class AuthCubit extends Cubit<AuthState> {
  final AuthRepositoryIml _repo;
  AuthCubit(this._repo) : super(AuthState()) {
    check();
  }

  Future<void> login(LoginData loginData) async {
    emit(state.copyWith(isLoading: true));
    if (loginData.username == null || loginData.password == null) {
      emit(state.copyWith(isLoading: false, error: 'Invalid credentials'));
    }
    final success = await _repo.login(loginData.username!, loginData.password!);
    emit(
      state.copyWith(
        isLoading: false,
        isAuthenticated: success,
        error: success ? null : 'Invalid credentials',
      ),
    );
  }

  Future<bool> refresh() async {
    return _repo.refresh();
  }

  Future<void> check() async {
    emit(state.copyWith(isChecking: true));
    final checkRefreshToken = await refresh();
    emit(state.copyWith(isAuthenticated: checkRefreshToken, isChecking: false));
  }
}
