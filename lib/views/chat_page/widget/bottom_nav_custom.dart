

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';
import 'package:vouch_chatroom/utils/color_lib.dart';
import 'package:vouch_chatroom/views/login/text_field_custom.dart';

class BottomNavCustom extends StatelessWidget {
  final TextEditingController messageController;
  final Function onTap;

  const BottomNavCustom({Key? key, required this.messageController, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(16, 8, 16, 16),
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: TextFieldCustom(
              borderRadius: BorderRadius.circular(50),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      enabled: true,
                      textInputAction: TextInputAction.go,
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        color: Colors.black,
                      ),
                      onSubmitted: (value) {
                        onTap();
                      },
                      controller: messageController,
                      decoration: InputDecoration(
                        hintText: "Message here...",
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
                  SizedBox(width: 8,),
                  InkWell(
                    onTap: () {
                      onTap();
                    },
                    child: Container(
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: ColorLib.colorPrimary,
                        borderRadius: BorderRadius.circular(50)
                      ),
                      child: Icon(
                        LineIcons.arrowUp,
                        color: Colors.white,
                        size: 22,
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
