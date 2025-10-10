import 'package:donuts_app/features/auth/data/repositories/auth_repository_iml.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthState {
  final bool isLoading;
  final bool isAuthenticated;
  final String? error;

  AuthState({this.isLoading = false, this.isAuthenticated = false, this.error});

  AuthState copyWith({bool? isLoading, bool? isAuthenticated, String? error}) {
    return AuthState(
      isLoading: isLoading ?? this.isLoading,
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
      error: error,
    );
  }
}

class AuthCubit extends Cubit<AuthState> {
  final AuthRepositoryIml _repo;
  AuthCubit(this._repo) : super(AuthState());

  Future<void> login(String username, String password) async {
    emit(state.copyWith(isLoading: true));
    final success = await _repo.login(username, password);
    emit(
      state.copyWith(
        isLoading: false,
        isAuthenticated: success,
        error: success ? null : 'Invalid credentials',
      ),
    );
  }
}
