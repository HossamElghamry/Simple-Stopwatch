import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum Actions {
  Start,
  Pause,
  Reset,
  Show,
}

class WatchBloc extends Bloc<Actions, int> {
  final stopwatch = Stopwatch();
  Timer timer;

  @override
  int get initialState => stopwatch.elapsedMilliseconds;

  bool active() {
    return stopwatch.isRunning;
  }

  void start() {
    dispatch(Actions.Start);
  }

  void pause() {
    dispatch(Actions.Pause);
  }

  void reset() {
    dispatch(Actions.Reset);
  }

  void show() {
    dispatch(Actions.Show);
  }

  @override
  Stream<int> mapEventToState(int currentState, Actions event) async* {
    switch (event) {
      case Actions.Start:
        stopwatch.start();
        timer = Timer.periodic(Duration(milliseconds: 30), (Timer timer) {
          show();
        });
        break;
      case Actions.Pause:
        stopwatch.stop();
        yield stopwatch.elapsedMilliseconds.truncate();
        break;
      case Actions.Reset:
        stopwatch.reset();
        stopwatch.stop();
        yield stopwatch.elapsedMilliseconds;
        break;
      case Actions.Show:
        yield stopwatch.elapsedMilliseconds;
        break;
    }
  }
}
