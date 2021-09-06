

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vouch_chatroom/service/model/chat_model.dart';
import 'package:vouch_chatroom/utils/color_lib.dart';

class MessageFromOtherUser extends StatelessWidget {
  final ChatModel chat;
  const MessageFromOtherUser({Key? key, required this.chat}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${chat.username}",
            style: GoogleFonts.inter(
              color: Colors.black,
              fontSize: 14,
              fontWeight: FontWeight.w400
            ),
          ),
          SizedBox(height: 4,),
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Color(0xffF6F6F6),
              border: Border.all(color: Color(0xffE8E8E8)),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
                bottomRight: Radius.circular(16),
              )
            ),
            child: Text(
              "${chat.message}",
              style: GoogleFonts.inter(
                color: Colors.black,
                fontWeight: FontWeight.w400,
                fontSize: 14
              ),
            ),
          ),
        ],
      ),
    );
  }
}
