import 'package:flutter_firebase_chat_core/flutter_firebase_chat_core.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:http/http.dart' as http;

class ChatHelper {
  static final FirebaseChatCore _instance = FirebaseChatCore.instance;
  static const String _cloudFunctionsAuthority =
      'us-central1-chance-bab22.cloudfunctions.net';

  static String? get userId => _instance.firebaseUser?.uid;

  static Stream<List<types.User>> get users => _instance.users();

  static Stream<List<types.Room>> get rooms =>
      _instance.rooms(orderByUpdatedAt: true);

  static Stream<List<types.Message>> messages(types.Room room) =>
      _instance.messages(room);

  static void sendMessage(String text, String roomId) {
    _instance.sendMessage(
      types.PartialText(text: text),
      roomId,
    );
  }

  static Future<types.Room> createRoom(types.User otherUser) =>
      _instance.createRoom(otherUser);

  static Future<types.Room> createGroupRoom({
    required String name,
    required List<types.User> users,
  }) {
    return _instance.createGroupRoom(name: name, users: users);
  }

  static Future<void> deleteRoom(String roomId) => _instance.deleteRoom(roomId);

  static void updateRoom(types.Room room) => _instance.updateRoom(room);

  static bool isSeenByMe(types.Message message) {
    if (message.author.id == userId) {
      return true;
    }
    if (message.metadata != null && message.metadata!['seen'] is Map) {
      Map<String, dynamic> seenMap = message.metadata!['seen'];
      return seenMap.entries.any((en) => en.key == userId && en.value);
    }
    return false;
  }

  static Future<void> updateLastMessageToSeen(String roomId) async {
    final Uri uri = Uri.http(
      _cloudFunctionsAuthority,
      '/updateMessagesToSeen',
      {'roomId': roomId},
    );
    final Map<String, String> headers = {
      'Content-Type': 'application/json',
      if (userId != null) 'uid': userId!,
    };

    try {
      await http.get(uri, headers: headers);
    } catch (_) {}
  }

  const ChatHelper._();
}
