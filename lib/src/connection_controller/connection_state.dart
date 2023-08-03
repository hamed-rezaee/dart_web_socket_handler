import 'package:equatable/equatable.dart';

abstract class ConnectionState with EquatableMixin {
  const ConnectionState();

  @override
  List<Object?> get props => <Object?>[];
}

class ConnectingState extends ConnectionState {
  const ConnectingState();
}

class ConnectedState extends ConnectionState {
  const ConnectedState();
}

class ReconnectingState extends ConnectionState {
  const ReconnectingState();
}

class ReconnectedState extends ConnectionState {
  const ReconnectedState();
}

class DisconnectingState extends ConnectionState {
  const DisconnectingState();
}

class DisconnectedState extends ConnectionState {
  const DisconnectedState({
    this.code,
    this.reason,
    this.error,
    this.stackTrace,
  });

  final int? code;
  final String? reason;
  final Object? error;
  final StackTrace? stackTrace;

  @override
  List<Object?> get props => <Object?>[code, reason];
}
