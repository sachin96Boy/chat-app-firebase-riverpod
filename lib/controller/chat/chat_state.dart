import 'package:equatable/equatable.dart';

class ChatState extends Equatable {
  const ChatState();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ChatStateInitial extends ChatState {
  const ChatStateInitial();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ChatStateLoading extends ChatState {
  const ChatStateLoading();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ChatStateSuccess extends ChatState {
  const ChatStateSuccess();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ChatStateError extends ChatState {
  final String error;

  const ChatStateError(this.error);

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
