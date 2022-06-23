import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  Future<void> login() async {
    emit(AuthLoading());
    emit(const AuthSuccess("our token"));
  }

  Future<void> logout() async {
    emit(AuthLoading());
    emit(AuthInitial());
  }
}
