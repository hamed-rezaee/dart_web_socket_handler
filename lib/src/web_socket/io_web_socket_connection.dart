import 'dart:io';

import 'package:dart_web_socket_handler/src/web_socket/base_web_socket_connection.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class IOWebSocketConnection implements BaseWebSocketConnection {
  @override
  WebSocketChannel getChannel(dynamic socket) => IOWebSocketChannel(socket);

  @override
  Future<WebSocket> connect(
    String url, {
    Iterable<String>? protocols,
    Duration? pingInterval,
    String? binaryType,
  }) async =>
      await WebSocket.connect(url, protocols: protocols)
        ..pingInterval = pingInterval;
}
