import 'package:chat_app_firebase/controller/chat/chat_controller.dart';
import 'package:chat_app_firebase/providers/firebase_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChatPage extends ConsumerStatefulWidget {
  static const routeName = '/chat';

  const ChatPage({
    super.key,
  });

  @override
  ConsumerState<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends ConsumerState<ChatPage> {
  final TextEditingController messageController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    messageController.dispose();
  }

  void sendMessage(String userId) {
    if (messageController.text.isEmpty) {
      return;
    }

    ref
        .read(chatControllerProvider.notifier)
        .sendMessage(userId, messageController.text);

    messageController.clear();
  }

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    final userName = args['userName'] as String;
    final userEmail = args['userEmail'] as String;
    final userId = args['userId'] as String;

    final currentUser = ref.read(firebaseAuthInstanceProvider);

    final chatService = ref
        .watch(firebaseChatServiceProvider)
        .getMessages(currentUser!.uid, userId);

    return Scaffold(
      appBar: AppBar(
        title: ListTile(
          leading: const CircleAvatar(
            child: Icon(Icons.person),
          ),
          title: Text(userName,
              style:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          subtitle: Text(userEmail),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.call)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.video_call)),
        ],
      ),
      body: Column(
        children: [
          StreamBuilder(
            stream: chatService,
            builder: (context, snapshot) {
              Widget children;
              if (snapshot.hasError) {
                children = const SizedBox(
                  child: Center(
                    child: Text('Something went wrong'),
                  ),
                );
              } else if (snapshot.hasData) {
                final messageData = snapshot.data!.docs;
                children = Expanded(
                  child: ListView.builder(
                    itemCount: messageData.length,
                    itemBuilder: (context, index) {
                      final data = messageData.map((e) => e.data()).toList();
                      return Text(data[index].toString());
                    },
                  ),
                );
              } else {
                children = const SizedBox(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }
              return children;
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(onPressed: () {}, icon: const Icon(Icons.attach_file)),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: messageController,
                    maxLines: null,
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey[200],
                      hintText: 'Write your message',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide: BorderSide.none,
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.file_copy),
                      ),
                    ),
                  ),
                ),
              ),
              IconButton(
                  onPressed: () {
                    sendMessage(userId);
                  },
                  icon: const CircleAvatar(
                    backgroundColor: Colors.green,
                    child: Icon(
                      Icons.send,
                      color: Colors.white,
                    ),
                  ))
            ],
          )
        ],
      ),
      // bottomNavigationBar: Row(
      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //   crossAxisAlignment: CrossAxisAlignment.center,
      //   children: [
      //     IconButton(onPressed: () {}, icon: const Icon(Icons.attach_file)),
      //     Expanded(
      //       child: Padding(
      //         padding: const EdgeInsets.all(8.0),
      //         child: TextFormField(
      //           controller: messageController,
      //           maxLines: null,
      //           keyboardType: TextInputType.multiline,
      //           decoration: InputDecoration(
      //             filled: true,
      //             fillColor: Colors.grey[200],
      //             hintText: 'Write your message',
      //             border: OutlineInputBorder(
      //               borderRadius: BorderRadius.circular(20.0),
      //               borderSide: BorderSide.none,
      //             ),
      //             suffixIcon: IconButton(
      //               onPressed: () {},
      //               icon: const Icon(Icons.file_copy),
      //             ),
      //           ),
      //           onFieldSubmitted: (value) {
      //             print(value);
      //           },
      //         ),
      //       ),
      //     ),
      //     IconButton(onPressed: () {}, icon: const Icon(Icons.camera)),
      //     IconButton(onPressed: () {}, icon: const Icon(Icons.mic)),
      //   ],
      // ),
    );
  }
}
