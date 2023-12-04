import 'package:chat_app_firebase/controller/chat/chat_state.dart';
import 'package:chat_app_firebase/providers/firebase_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChatController extends StateNotifier<ChatState> {
  final Ref ref;

  ChatController({required this.ref}) : super(const ChatStateInitial());

  void sendMessage(String receiverId, String message) async {
    state = const ChatStateLoading();

    try {
      await ref
          .read(firebaseChatServiceProvider)
          .sendMessage(receiverId, message);
      state = const ChatStateSuccess();
    } catch (e) {
      state = ChatStateError(e.toString());
    }
  }
}

final chatControllerProvider = StateNotifierProvider<ChatController, ChatState>(
    (ref) => ChatController(ref: ref));
