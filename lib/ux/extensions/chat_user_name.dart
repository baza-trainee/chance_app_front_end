import 'package:flutter_chat_types/flutter_chat_types.dart' as types;

extension ChatUserName on types.User {
  String get fullName => firstName == null || lastName == null
      ? 'Undefiend User'
      : '$firstName $lastName';
}
