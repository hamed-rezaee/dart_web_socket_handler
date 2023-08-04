import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dart_web_socket_handler/web_socket_handler.dart';

void main() async {
  final Uri uri = Uri.parse('wss://ws.binaryws.com/websockets/v3?app_id=1089');
  final WebSocket socket = WebSocket(uri);

  socket.connection.listen(stdout.writeln);
  socket.messages.listen(stdout.writeln);

  socket.send(jsonEncode(<String, dynamic>{'ticks': 'R_50', 'subscribe': 1}));

  await Future<void>.delayed(const Duration(seconds: 60));

  await socket.close();
}
