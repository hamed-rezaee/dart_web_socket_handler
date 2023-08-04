import 'dart:async';
import 'dart:html';

import 'package:dart_web_socket_handler/src/web_socket/base_web_socket_connection.dart';
import 'package:web_socket_channel/html.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class HTMLWebSocketConnection implements BaseWebSocketConnection {
  @override
  WebSocketChannel getChannel(dynamic socket) => HtmlWebSocketChannel(socket);

  @override
  Future<WebSocket> connect(
    String url, {
    Iterable<String>? protocols,
    Duration? pingInterval,
    String? binaryType,
  }) async {
    final WebSocket socket = WebSocket(url, protocols)..binaryType = binaryType;

    if (socket.readyState == 1) {
      return socket;
    }

    final Completer<WebSocket> completer = Completer<WebSocket>();

    unawaited(socket.onOpen.first.then((_) => completer.complete(socket)));

    unawaited(
      socket.onError.first.then(
        (Event event) {
          final Object? error = event is ErrorEvent ? event.error : null;

          completer.completeError(error ?? 'unknown error');
        },
      ),
    );

    return completer.future;
  }
}
