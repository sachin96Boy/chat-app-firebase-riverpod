import 'package:chat_app_firebase/providers/firebase_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MessagesBody extends ConsumerWidget {
  const MessagesBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chatState = ref.watch(firebasefirestoreStateProvier);
    return Container(
      color: Colors.green,
      child: Center(
          child: chatState.when(
        data: (data) {
          final dataList = data.docs;
          return ListView.builder(
            itemCount: data.docs.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(dataList[index].data().toString()),
              );
            },
          );
        },
        error: (error, stackTrace) {
          return Text(error.toString());
        },
        loading: () => const CircularProgressIndicator(),
      )),
    );
  }
}
