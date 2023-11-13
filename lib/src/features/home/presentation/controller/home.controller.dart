import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:spotiflutter/src/features/home/presentation/ui/state/home.state.dart';

@Injectable()
class HomeController {
  ValueNotifier<HomeState> state = ValueNotifier(HomeState(pageIndex: 0));

  void setPageIndex(int value) {
    state.value = state.value.copyWith(
      pageIndex: value,
    );
  }
}
