import 'package:equatable/equatable.dart';

class AuthState extends Equatable {
  const AuthState();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class AuthStateInitial extends AuthState {
  const AuthStateInitial();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class AuthStateLoading extends AuthState {
  const AuthStateLoading();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class AuthStateSuccess extends AuthState {
  const AuthStateSuccess();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class AuthStateError extends AuthState {
  final String error;
  
  const AuthStateError(this.error);

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
