import 'dart:async';

import 'base_connection_controller.dart';
import 'connection_state.dart';

class ConnectionController extends BaseConnectionController {
  ConnectionController()
      : _state = const ConnectingState(),
        _controller = StreamController<ConnectionState>.broadcast() {
    _controller.add(_state);
  }

  ConnectionState _state;
  final StreamController<ConnectionState> _controller;

  @override
  ConnectionState get state => _state;

  @override
  StreamSubscription<ConnectionState> listen(
    void Function(ConnectionState event)? onData, {
    Function? onError,
    void Function()? onDone,
    bool? cancelOnError,
  }) =>
      _getStream().distinct().listen(
            onData,
            onError: onError,
            onDone: onDone,
            cancelOnError: cancelOnError,
          );

  Stream<ConnectionState> _getStream() async* {
    yield _state;
    yield* _controller.stream;
  }

  void add(ConnectionState state) {
    _state = state;
    _controller.add(state);
  }

  void close() => _controller.close();
}
