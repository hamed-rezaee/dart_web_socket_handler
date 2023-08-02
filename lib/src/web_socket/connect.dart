import 'package:web_socket_channel/web_socket_channel.dart';

WebSocketChannel getChannel(dynamic socket) =>
    throw UnsupportedError('No implementation of the api provided.');

Future<dynamic> connect(
  String url, {
  Iterable<String>? protocols,
  Duration? pingInterval,
  String? binaryType,
}) =>
    throw UnsupportedError('No implementation of the api provided.');
