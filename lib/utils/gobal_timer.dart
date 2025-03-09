import 'dart:async';

class GlobalTimer{
  GlobalTimer._privateConstructor();
  static GlobalTimer instance=GlobalTimer._privateConstructor();
  StreamController<int> _controller = StreamController<int>.broadcast();
  Timer? _timer;
  int _count = 0;

  Stream<int> get timerStream => _controller.stream;

  void start() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      _controller.add(++_count); // Emit count every second
    });
  }

  void stop() {

    _timer?.cancel();

    _count=0;
  }

}