import 'connection_state.dart';

abstract class BaseConnectionController extends Stream<ConnectionState> {
  ConnectionState get state;
}
