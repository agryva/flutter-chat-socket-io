

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vouch_chatroom/service/model/chat_model.dart';
import 'package:vouch_chatroom/utils/color_lib.dart';

class MessageFromUser extends StatelessWidget {
  final ChatModel chat;
  const MessageFromUser({Key? key, required this.chat}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          padding: EdgeInsets.all(16),
          margin: EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            color: ColorLib.colorPrimary,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              bottomLeft: Radius.circular(16),
              topRight: Radius.circular(16)
            )
          ),
          child: Text(
            "${chat.message}",
            style: GoogleFonts.inter(
              color: Colors.white,
              fontWeight: FontWeight.w400,
              fontSize: 14
            ),
          ),
        ),
      ],
    );
  }
}
