
import 'package:get_it/get_it.dart';
import 'package:vouch_chatroom/service/socket_io_container.dart';

final inject = GetIt.instance;

Future<void> init() async {
  //BLOC
  inject.registerLazySingleton(() => SocketIoContainer());
}