

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vouch_chatroom/di/injection.dart';
import 'package:vouch_chatroom/service/socket_io_container.dart';
import 'package:vouch_chatroom/utils/color_lib.dart';
import 'package:vouch_chatroom/utils/helpers.dart';
import 'package:vouch_chatroom/views/chat_page/chat_page.dart';
import 'package:vouch_chatroom/views/login/text_field_custom.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  TextEditingController usernameController = TextEditingController();
  TextEditingController roomIdController = TextEditingController();

  late SocketIoContainer socketIoContainer;

  @override
  void initState() {
    socketIoContainer = inject<SocketIoContainer>();
    socketIoContainer.socketIO.on("users", (data) {
      Navigator.push(
        context,
        CupertinoPageRoute(builder: (context) => ChatPage(
          roomId: roomIdController.text,
          userName: usernameController.text,
        )),
      ).then((value) {
        socketIoContainer.socketIO.disconnect();
        socketIoContainer.socketIO.connect();
      });
    });
    socketIoContainer.socketIO.on("join_room_error", (data) {
      Helpers.showSnackBar(context,
          snackBarMode: SnackBarMode.ERROR,
          content: data
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          width: Helpers.getWidthPageSize(context),
          height: Helpers.getHeightPageSize(context),
          padding: EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Join Chatroom",
                style: GoogleFonts.inter(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.w600
                ),
              ),
              SizedBox(height: 32,),
              TextFieldCustom(
                child: TextField(
                  enabled: true,
                  controller: usernameController,
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    color: Colors.black,
                  ),
                  decoration: InputDecoration(
                    hintText: "Username",
                    isDense: true,
                    contentPadding: EdgeInsets.only(top: 0, bottom: 0),
                    border: InputBorder.none,
                    hintStyle: GoogleFonts.inter(
                      fontSize: 14,
                      color: Color(0xffBDBDBD),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16,),
              TextFieldCustom(
                child: TextField(
                  enabled: true,
                  controller: roomIdController,
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    color: Colors.black,
                  ),
                  decoration: InputDecoration(
                    hintText: "RoomID",
                    isDense: true,
                    contentPadding: EdgeInsets.only(top: 0, bottom: 0),
                    border: InputBorder.none,
                    hintStyle: GoogleFonts.inter(
                      fontSize: 14,
                      color: Color(0xffBDBDBD),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 32,),
              InkWell(
                onTap: buttonClicked,
                child: Container(
                  width: Helpers.getWidthPageSize(context),
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: ColorLib.colorPrimary,
                    borderRadius: BorderRadius.circular(50)
                  ),
                  child: Text(
                    "JOIN",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.inter(
                      color: Colors.white,
                      fontWeight: FontWeight.w600
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void buttonClicked() {
    if (usernameController.text.isNotEmpty && roomIdController.text.isNotEmpty) {
      socketIoContainer.socketIO.emit("join_room", json.decode(json.encode({
        'username': usernameController.text,
        "roomId": roomIdController.text
      })));

    } else {
      Helpers.showSnackBar(context,
          snackBarMode: SnackBarMode.ERROR,
          content: "Username or Room Id Cannot be empty"
      );
    }
  }
}
