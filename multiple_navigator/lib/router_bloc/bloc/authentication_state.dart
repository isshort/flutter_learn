// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:equatable/equatable.dart';

import '../type/authentication_status_type.dart';

/// auth state.
abstract class AuthState extends Equatable {
  /// create auth state
  const AuthState({
    required this.status,
    this.name,
  });

  /// Auth status
  final AuthenticationStatusType? status;

  /// user name
  final String? name;
  @override
  List<Object> get props =>
      <Object>[status ?? AuthenticationStatusType.unknown, 'unknown'];
}

/// auth initial state.
class AuthInitial extends AuthState {
  /// create auth initial state.
  const AuthInitial() : super(status: AuthenticationStatusType.unknown);
  @override
  List<Object> get props => <Object>[];
}

/// auth authenticated state.
class AuthAuthenticated extends AuthState {
  /// create auth authenticated state.
  const AuthAuthenticated({required String? name})
      : super(status: AuthenticationStatusType.authenticated, name: name);
  @override
  List<Object> get props => <Object>[name ?? ''];
}

/// auth unauthenticated state.
class AuthUnAuthenticated extends AuthState {
  /// create auth unauthenticated state.
  const AuthUnAuthenticated()
      : super(status: AuthenticationStatusType.unauthenticated);
  @override
  List<Object> get props => <Object>[];
}

/// auth unknown state.
class AuthUnknown extends AuthState {
  /// create auth unknown state.
  const AuthUnknown() : super(status: AuthenticationStatusType.unknown);
  @override
  List<Object> get props => <Object>[];
}

/// error state
class AuthError extends AuthState {
  /// create error state
  const AuthError({
    this.errorMessage = '',
  }) : super(status: AuthenticationStatusType.unknown);

  /// error message
  final String errorMessage;

  @override
  List<Object> get props => <Object>[];
}
