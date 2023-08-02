import 'package:equatable/equatable.dart';

abstract class ConnectionState with EquatableMixin {
  const ConnectionState();
}

class ConnectingState extends ConnectionState {
  const ConnectingState();

  @override
  List<Object?> get props => <Object?>[];
}

class ConnectedState extends ConnectionState {
  const ConnectedState();

  @override
  List<Object?> get props => <Object?>[];
}

class ReconnectingState extends ConnectionState {
  const ReconnectingState();

  @override
  List<Object?> get props => <Object?>[];
}

class ReconnectedState extends ConnectionState {
  const ReconnectedState();

  @override
  List<Object?> get props => <Object?>[];
}

class DisconnectingState extends ConnectionState {
  const DisconnectingState();

  @override
  List<Object?> get props => <Object?>[];
}

class DisconnectedState extends ConnectionState {
  const DisconnectedState([
    this.code,
    this.reason,
    this.error,
    this.stackTrace,
  ]);

  final int? code;
  final String? reason;
  final Object? error;
  final StackTrace? stackTrace;

  @override
  List<Object?> get props => <Object?>[code, reason];
}
