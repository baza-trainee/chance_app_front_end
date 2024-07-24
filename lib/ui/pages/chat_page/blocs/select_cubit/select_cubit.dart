import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_bloc/flutter_bloc.dart';

class SelectCubit extends Cubit<List<types.User>> {
  SelectCubit({List<types.User> list = const []}) : super(list);

  void add(types.User value) {
    List<types.User> list = [...state, value];
    emit(list);
  }

  void addAll(List<types.User> value) {
    List<types.User> list = <types.User>{...state, ...value}.toList();
    emit(list);
  }

  void remove(types.User value) {
    List<types.User> list = List.from(state)..remove(value);
    emit(list);
  }
}
