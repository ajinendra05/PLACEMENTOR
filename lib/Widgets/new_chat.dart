import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class NewChatField extends StatefulWidget {
  const NewChatField({super.key});

  @override
  State<NewChatField> createState() => _NewChatFieldState();
}

class _NewChatFieldState extends State<NewChatField> {
  final messageController = TextEditingController();
  var messageInput = '';

  void sendMessage() async {
    FocusScope.of(context).unfocus();

    final user = FirebaseAuth.instance.currentUser;
    final userData = await FirebaseFirestore.instance
        .collection('users')
        .doc(user!.uid)
        .get();
    FirebaseFirestore.instance.collection('chat').add({
      'text': messageInput,
      'createAt': Timestamp.now(),
      'userId': user.uid,
      'userName': userData.data()!['userName'],
    });
    messageController.clear();
    setState(() {
      messageInput = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.1,
      margin: const EdgeInsets.only(top: 8),
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          Expanded(
              child: TextField(
            controller: messageController,
            onChanged: (value) {
              setState(() {
                messageInput = value;
              });
            },
            decoration:
                const InputDecoration(label: Text('Enter message to send')),
          )),
          ElevatedButton(
              onPressed: messageInput.trim().isEmpty ? null : sendMessage,
              child: const Icon(Icons.send))
        ],
      ),
    );
  }
}
