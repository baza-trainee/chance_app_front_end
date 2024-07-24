import 'package:chance_app/ui/constans.dart';
import 'package:chance_app/ux/extensions/chat_user_name.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_firebase_chat_core/flutter_firebase_chat_core.dart';
import 'package:intl/intl.dart' show DateFormat;
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;

class ChatBubbleWidget extends StatelessWidget {
  const ChatBubbleWidget({
    super.key,
    required this.message,
  });

  final types.TextMessage message;

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.sizeOf(context);

    bool isMine =
        message.author.id == FirebaseChatCore.instance.firebaseUser?.uid;
    DateTime? updatedAt = message.updatedAt != null
        ? DateTime.fromMillisecondsSinceEpoch(message.updatedAt!)
        : null;

    return Align(
      alignment: isMine ? Alignment.topRight : Alignment.topLeft,
      child: Container(
        margin: const EdgeInsets.only(top: 12.0),
        padding: const EdgeInsets.fromLTRB(10.0, 8.0, 10.0, 4.0),
        constraints: BoxConstraints(
          minWidth: screenSize.width * 0.3,
          maxWidth: screenSize.width * 0.8,
        ),
        decoration: BoxDecoration(
          color: darkNeutral300,
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(8.0),
            topRight: const Radius.circular(8.0),
            bottomRight: isMine ? Radius.zero : const Radius.circular(8.0),
            bottomLeft: isMine ? const Radius.circular(8.0) : Radius.zero,
          ),
        ),
        child: Column(
          crossAxisAlignment:
              isMine ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              message.author.fullName,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14,
                height: 20 / 14,
                letterSpacing: 0.1,
                color: darkNeutral1000,
              ),
            ),
            const SizedBox(height: 2.0),
            Text(
              message.text,
              style: const TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14,
                height: 20 / 14,
                letterSpacing: 0.25,
                color: darkNeutral1000,
              ),
            ),
            if (updatedAt != null) ...[
              const SizedBox(height: 2.0),
              Text(
                DateFormat('HH:mm').format(updatedAt),
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 11,
                  height: 16 / 11,
                  letterSpacing: 0.5,
                  color: darkNeutral1000.withOpacity(.3),
                ),
              ),
            ]
          ],
        ),
      ),
    );
  }
}
