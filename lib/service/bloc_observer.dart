import 'package:flutter_bloc/flutter_bloc.dart';

class CustomBlocObserver extends BlocObserver {

  @override
  void onEvent(Bloc bloc, Object? event) {
    print('bloc: ${bloc.runtimeType}, event: $event');
    super.onEvent(bloc, event);
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    print('cubit: ${bloc.runtimeType}, change: $change');
    super.onChange(bloc, change);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    print('bloc: ${bloc.runtimeType}, transition: $transition');
    super.onTransition(bloc, transition);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    print('cubit: ${bloc.runtimeType}, error: $error');
    super.onError(bloc, error, stackTrace);
  }
}