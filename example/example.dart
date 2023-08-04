import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dart_web_socket_handler/web_socket_handler.dart';

void main() async {
  // Define the [uri] to which to connect.
  final Uri uri = Uri.parse('wss://ws.binaryws.com/websockets/v3?app_id=1089');
  // Create a [WebSocket] instance from [uri] and connect to it.
  final WebSocket socket = WebSocket(uri);

  // Listen to the [connection] state changes.
  socket.connection.listen(stdout.writeln);
  // Listen to the [messages] received from the server.
  socket.messages.listen(stdout.writeln);

  // Send a message to the server.
  socket.send(jsonEncode(<String, dynamic>{'ticks': 'R_50', 'subscribe': 1}));

  // Wait for 60 seconds to receive messages from the server.
  // This is just for preventing the program from exiting.
  await Future<void>.delayed(const Duration(seconds: 60));

  // Close the connection.
  await socket.close();
}
