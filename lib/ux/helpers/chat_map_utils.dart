import 'package:flutter_chat_types/flutter_chat_types.dart' as types;

class ChatMapUtils {
  const ChatMapUtils._();

  static Map<String, List<types.User>> generateSortMap(List<types.User> list) {
    Map<String, List<types.User>> map = {};
    list.sort((a, b) => a.lastName!.compareTo(b.lastName!));
    for (types.User item in list) {
      String firstLetter;

      if (item.lastName?.isNotEmpty ?? false) {
        firstLetter = item.lastName!.trim()[0].toUpperCase();
      } else if (item.firstName?.isNotEmpty ?? false) {
        firstLetter = item.firstName!.trim()[0].toUpperCase();
      } else {
        continue;
      }

      map.putIfAbsent(firstLetter, () => []);
      map[firstLetter]!.add(item);
    }

    return map;
  }
}
