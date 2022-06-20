part of 'auth_cubit.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object?> get props => [];
}

class AuthInitial extends AuthState {
  @override
  List<Object?> get props => [];
}

class AuthLoading extends AuthState {
  @override
  List<Object?> get props => [];
}

class AuthSuccess extends AuthState {
  final String? token;

  const AuthSuccess(this.token);

  @override
  List<Object?> get props => [token];
}

class AuthError extends AuthState {
  final String? message;

  const AuthError(this.message);
  @override
  List<Object?> get props => [message];
}
