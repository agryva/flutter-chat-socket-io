

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';
import 'package:vouch_chatroom/di/injection.dart';
import 'package:vouch_chatroom/service/model/chat_model.dart';
import 'package:vouch_chatroom/service/socket_io_container.dart';
import 'package:vouch_chatroom/utils/color_lib.dart';
import 'package:vouch_chatroom/utils/helpers.dart';
import 'package:vouch_chatroom/views/chat_page/widget/bottom_nav_custom.dart';
import 'package:vouch_chatroom/views/chat_page/widget/message_from_other_user.dart';
import 'package:vouch_chatroom/views/chat_page/widget/message_from_user.dart';
import 'package:provider/provider.dart';

class ChatPage extends StatefulWidget {
  final String roomId;
  final String userName;
  const ChatPage({Key? key, required this.roomId, required this.userName}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  ScrollController? _controller;
  TextEditingController messageController = TextEditingController();
  List<ChatModel> listChatModel = [];

  late SocketIoContainer socketIoContainer;

  @override
  void initState() {
    socketIoContainer = inject<SocketIoContainer>();
    _controller = ScrollController();
    listChatModel = [];
    socketIoContainer.socketIO.on("message", (data) {
      listChatModel.add(ChatModel(username: data["user"], message: data["text"]));
        WidgetsBinding.instance!.addPostFrameCallback((_){
          if (_controller?.hasClients ?? false) {
            print("asdlkjalsd");
            _controller?.animateTo(
              _controller!.position.maxScrollExtent,
              duration: Duration(seconds: 1),
              curve: Curves.fastOutSlowIn,
            );
          }

          if (mounted) {
            setState(() {

            });
          }

        });

      if (mounted) {
        setState(() {

        });
      }
    });
    super.initState();
  }

  @override
  void didChangeDependencies() {

    super.didChangeDependencies();
  }


  @override
  void dispose() {
    _controller?.dispose();
    // socketIoContainer.socketIO.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: true,
        leading: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Container(
                  padding: EdgeInsets.all(8),
                  child: Text(
                    "Exit",
                    style: GoogleFonts.inter(
                      color: ColorLib.colorPrimary,
                      fontWeight: FontWeight.w500,
                      fontSize: 16
                    ),
                  )
              ),
            ),
          ],
        ),
        title: Text(
          "${widget.roomId}",
          style: TextStyle(
              color: Colors.black,
              fontSize: 21,
              fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Container(
          width: Helpers.getWidthPageSize(context),
          height: Helpers.getHeightPageSize(context),
          child: SingleChildScrollView(
            controller: _controller,
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListView.builder(
                    itemCount: listChatModel.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      if (listChatModel[index].username == widget.userName) {
                        return MessageFromUser(
                          chat: listChatModel[index],
                        );
                      } else {
                        return MessageFromOtherUser(
                          chat: listChatModel[index],
                        );
                      }
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavCustom(
        messageController: messageController,
        onTap: () {
          if (messageController.text.isNotEmpty) {
            socketIoContainer.socketIO.emit("send_message", json.decode(json.encode({
              'message': messageController.text
            })));
            messageController.clear();
          }

        },
      ),
    );
  }
}
