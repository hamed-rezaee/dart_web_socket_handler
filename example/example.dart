// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:dart_web_socket_handler/web_socket_handler.dart';

void main() async {
  final Uri uri = Uri.parse('wss://ws.binaryws.com/websockets/v3?app_id=1089');
  final WebSocket socket = WebSocket(uri);

  await socket.initialize();

  socket.connection.listen((ConnectionState state) => print('state: "$state"'));

  socket.messages.listen((dynamic message) {
    print('message: "$message"');
  });

  socket.send(
    jsonEncode(<String, dynamic>{
      'ticks': 'R_50',
      'subscribe': 1,
    }),
  );

  await Future<void>.delayed(const Duration(seconds: 5));

  await socket.close();
}
