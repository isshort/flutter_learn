import 'dart:async';

abstract class StateStream<T> {
  StateStream();

  /// Create StateStream with initial value
  StateStream.seeded(T value) : state = value {
    _controller.add(value);
  }
  final StreamController<T> _controller = StreamController<T>();

  late T state;

  /// the [Stream] object
  Stream<T> get stream => _controller.stream;

  /// pipes a new state into the stream
  void emit(T state) {
    this.state;
    _controller.add(state);
  }

  void dispose() {
    _controller.close();
  }
}

class LoggedInState extends StateStream<bool> {
  LoggedInState();

  LoggedInState.seeded(bool value) : super.seeded(value);
}
