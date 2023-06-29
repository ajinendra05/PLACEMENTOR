import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'message_bubble.dart';

class Messages extends StatelessWidget {
  const Messages({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    final stream = FirebaseFirestore.instance
        .collection('chat')
        .orderBy('createAt', descending: true)
        .snapshots();
    return StreamBuilder(
      stream: stream,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        final chatdata = snapshot.data!.docs;
        return ListView.builder(
          reverse: true,
          itemCount: chatdata.length,
          itemBuilder: (context, index) {
            return MessageBubble(
              userName: chatdata[index]['userName'],
              message: chatdata[index]['text'],
              isMe: chatdata[index]['userId'] == user!.uid,
            );
          },
        );
      },
    );
  }
}
