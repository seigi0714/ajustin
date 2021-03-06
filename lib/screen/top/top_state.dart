import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:state_notifier/state_notifier.dart';
part 'top_state.freezed.dart';

@freezed
abstract class TopState with _$TopState {
  const factory TopState({
    int pageIndex,
  }) = _TopState;
}

class TopController extends StateNotifier<TopState> {
  TopController()
      : super(TopState(
          pageIndex: 0,
        )) {}

  void changePageIndex(int index) {
    state = state.copyWith(pageIndex: index);
  }
}
