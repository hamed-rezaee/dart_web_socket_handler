// ignore_for_file: avoid_redundant_argument_values

import 'package:test/test.dart';

import 'package:dart_web_socket_handler/web_socket_handler.dart';

void main() {
  group('ConnectionState tests =>', () {
    test('ConnectingState equality test.', () {
      const ConnectingState state1 = ConnectingState();
      const ConnectingState state2 = ConnectingState();

      expect(state1, equals(state2));
    });

    test('ConnectedState equality test.', () {
      const ConnectedState state1 = ConnectedState();
      const ConnectedState state2 = ConnectedState();

      expect(state1, equals(state2));
    });

    test('ReconnectingState equality test.', () {
      const ReconnectingState state1 = ReconnectingState();
      const ReconnectingState state2 = ReconnectingState();

      expect(state1, equals(state2));
    });

    test('ReconnectedState equality test.', () {
      const ReconnectedState state1 = ReconnectedState();
      const ReconnectedState state2 = ReconnectedState();

      expect(state1, equals(state2));
    });

    test('DisconnectingState equality test.', () {
      const DisconnectingState state1 = DisconnectingState();
      const DisconnectingState state2 = DisconnectingState();

      expect(state1, equals(state2));
    });

    test('DisconnectedState equality test.', () {
      final DisconnectedState state1 =
          DisconnectedState(1, 'reason', 'error state 1', StackTrace.current);
      final DisconnectedState state2 =
          DisconnectedState(1, 'reason', 'error state 2', StackTrace.current);

      expect(state1, equals(state2));
    });

    test('DisconnectedState with different code and reason test.', () {
      const DisconnectedState state1 = DisconnectedState(1, 'reason1');
      const DisconnectedState state2 = DisconnectedState(2, 'reason2');

      expect(state1, isNot(equals(state2)));
    });

    test('DisconnectedState with null values test.', () {
      const DisconnectedState state1 =
          DisconnectedState(null, null, null, null);
      const DisconnectedState state2 =
          DisconnectedState(null, null, null, null);

      expect(state1, equals(state2));
    });

    test('DisconnectedState with different error and stackTrace test.', () {
      final DisconnectedState state1 =
          DisconnectedState(1, 'reason', 'error1', StackTrace.current);
      final DisconnectedState state2 =
          DisconnectedState(1, 'reason', 'error2', StackTrace.current);

      expect(state1, equals(equals(state2)));
    });
  });
}
