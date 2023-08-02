// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:dart_web_socket_handler/src/connection_controller/connection_state.dart';
import 'package:dart_web_socket_handler/src/web_socket.dart';

void main() async {
  final Uri uri = Uri.parse('wss://ws.binaryws.com/websockets/v3?app_id=1089');
  final WebSocket socket = WebSocket(uri);

  socket.connection.listen((ConnectionState state) {
    print('state: "$state"');

    if (state is ConnectedState) {
      socket.send(
        jsonEncode(<String, dynamic>{
          'ticks': 'R_50',
          'subscribe': 1,
        }),
      );
    }
  });

  socket.messages.listen((dynamic message) {
    print('message: "$message"');
  });

  await Future<void>.delayed(const Duration(seconds: 5));

  await socket.close();
}
