


import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:socket_io_client/socket_io_client.dart';

class SocketIoContainer {
  late IO.Socket _socketIO;

  SocketIoContainer() {
    _socketIO = IO.io('http://192.168.0.188:8080',
        OptionBuilder()
            .setTransports(['websocket', 'polling']) // for Flutter or Dart VM
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
      print("ini onConnectError ${f}");
    });
    _socketIO.onDisconnect((_) => print('disconnect'));
    _socketIO.on('fromServer', (_) => print(_));
    // _socketIO.connect();

  }

  IO.Socket get socketIO => _socketIO;

}