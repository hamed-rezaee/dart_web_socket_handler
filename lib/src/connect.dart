import 'dart:io';

import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

WebSocketChannel getWebSocketChannel(WebSocket socket) =>
    IOWebSocketChannel(socket);

Future<WebSocket> connect(
  String url, {
  Iterable<String>? protocols,
  Duration? pingInterval,
  String? binaryType,
}) async =>
    await WebSocket.connect(url, protocols: protocols)
      ..pingInterval = pingInterval;
