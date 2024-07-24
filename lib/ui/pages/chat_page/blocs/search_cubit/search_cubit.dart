import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;

class SearchCubit extends Cubit<List<types.User>> {
  final List<types.User> _list;

  SearchCubit(this._list) : super([]);

  void search(String value) {
    if (value.isEmpty) {
      return clear();
    }
    return emit(
      _list
          .where((v) =>
              v.firstName != null &&
              v.firstName!
                  .trim()
                  .toLowerCase()
                  .startsWith(value.trim().toLowerCase()))
          .toList(),
    );
  }

  void clear() => emit([]);
}
