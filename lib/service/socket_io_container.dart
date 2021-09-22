


// import 'package:vouch_chatroom/utils/custom_socket_io_client.dart' as IO;
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:socket_io_client/socket_io_client.dart';

class SocketIoContainer {
  late IO.Socket _socketIO;

  SocketIoContainer() {
    _socketIO = IO.io('http://igun.someah.id',
        OptionBuilder()
            .setTransports(['websocket', 'polling'])
            .enableAutoConnect()
            .enableForceNew()
            .build());

    _socketIO.onConnect((d) {
      print("ini konek");
    });
    _socketIO.onError((_) {
      print("ini error");
    });
    _socketIO.onReconnect((_) {
      print("ini onReconnect");
    });
    _socketIO.onConnectError((f) {
      print("ini onConnectError $f");
    });
    _socketIO.onDisconnect((_) => print('disconnect'));
    _socketIO.on('fromServer', (_) => print(_));
    // _socketIO.connect();

  }

  IO.Socket get socketIO => _socketIO;

}