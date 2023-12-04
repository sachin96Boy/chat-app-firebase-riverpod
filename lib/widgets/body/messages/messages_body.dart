import 'package:chat_app_firebase/providers/firebase_providers.dart';
import 'package:chat_app_firebase/screens/chat_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MessagesBody extends ConsumerWidget {
  const MessagesBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chatState = ref.watch(firebasefirestoreStateProvier);
    final authUser = ref.watch(firebaseAuthInstanceProvider);
    return Stack(
      children: [
        Positioned(
          top: 60,
          left: 0,
          right: 0,
          bottom: 0,
          child: Container(
            height: MediaQuery.of(context).size.height * 0.7,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40.0),
                    topRight: Radius.circular(40.0))),
            child: Center(
                child: chatState.when(
              data: (data) {
                final dataList = data.docs;
                return ListView.builder(
                  itemCount: data.docs.length,
                  itemBuilder: (context, index) {
                    final data = dataList[index].data();
                    if (authUser!.email != data['email']) {
                      return GestureDetector(
                        onTap: () => Navigator.of(context)
                            .pushNamed(ChatPage.routeName, arguments: {
                          'userName': data['firstName'],
                          'userEmail': data['email']
                        }),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            ListTile(
                              leading:
                                  const CircleAvatar(child: Icon(Icons.person)),
                              title: Text(data['email'].toString()),
                              style: ListTileStyle.list,
                            ),
                            const Divider(),
                          ],
                        ),
                      );
                    }
                    return const SizedBox();
                  },
                );
              },
              error: (error, stackTrace) {
                return Text(error.toString());
              },
              loading: () => const CircularProgressIndicator(),
            )),
          ),
        ),
      ],
    );
  }
}
