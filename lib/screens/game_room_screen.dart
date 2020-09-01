import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class GameRoomScreen extends StatefulWidget {
  @override
  _GameRoomScreenState createState() => _GameRoomScreenState();
}

class _GameRoomScreenState extends State<GameRoomScreen> {
  WebSocketChannel channel;

  void connect() {
    setState(() {
      channel = IOWebSocketChannel.connect(
          'ws://10.0.2.2:8000/game_engine/${_usernameController.text}/${_roomnameController.text}/ws/chat/${_usernameController.text}/${_roomnameController.text}/');
      print("Connected!");

      channel.stream.listen((event) {
        print(event);
        setState(() {
          messages = "$messages\n$event";
        });
      });
    });
  }

  void disconnect() {
    print("Disconnecting...");
    channel.sink.close();
  }

  TextEditingController _controller = TextEditingController();
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _roomnameController = TextEditingController();

  void update() {
    setState(() {});
  }

  void _sendMessage() {
    if (_controller.text.isNotEmpty) {
      var msg = jsonEncode({'message': _controller.text});
      print("Sending: $msg");
      channel.sink.add(msg);
    }
  }

  String messages = "";

  @override
  Widget build(BuildContext context) {
    return Container(
        child: SingleChildScrollView(
      child: Column(
        children: [
          Text('Username'),
          Form(
            child: TextFormField(
              controller: _usernameController,
              decoration: InputDecoration(labelText: 'Username'),
            ),
          ),
          Text('Room'),
          Form(
            child: TextFormField(
              controller: _roomnameController,
              decoration: InputDecoration(labelText: 'Room'),
            ),
          ),
          Row(
            children: [
              RaisedButton(
                onPressed: connect,
                child: Text("Connect"),
              ),
              RaisedButton(
                onPressed: disconnect,
                child: Text("Disconnect"),
              ),
            ],
          ),
          Text(messages),
          Form(
            child: TextFormField(
              controller: _controller,
              decoration: InputDecoration(labelText: 'Send a message'),
            ),
          ),
          FloatingActionButton(
            onPressed: _sendMessage,
            tooltip: 'Send message',
            child: Icon(Icons.send),
          ),
        ],
      ),
    ));
  }
}
