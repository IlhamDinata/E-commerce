import 'package:flutter/material.dart';

class Roomchat extends StatefulWidget {
  const Roomchat({super.key});

  @override
  State<Roomchat> createState() => _RoomchatState();
}

class _RoomchatState extends State<Roomchat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Text('Roomchat'),
      ),
    );
  }
}
