// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter_bloc/flutter_bloc.dart';
import '../type/authentication_status_type.dart';
import 'authentication_event.dart';
import 'authentication_state.dart';

/// A [Bloc] which manages users authentication .
class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthState> {
  /// Creates an [AuthenticationBloc].
  AuthenticationBloc() : super(const AuthInitial()) {
    on<AuthenticationStatusChanged>((
      AuthenticationStatusChanged event,
      Emitter<AuthState> emit,
    ) async {
      await _onAuthenticationStatusChanged(event, emit);
    });
  }

  Future<void> _onAuthenticationStatusChanged(
    AuthenticationStatusChanged event,
    Emitter<AuthState> emit,
  ) async {
    switch (event.status) {
      case AuthenticationStatusType.unauthenticated:
        emit(const AuthUnAuthenticated());
        break;
      case AuthenticationStatusType.authenticated:
        emit(AuthAuthenticated(name: event.name));
        break;
      case AuthenticationStatusType.unknown:
        emit(const AuthUnknown());
        break;
    }
  }
}
