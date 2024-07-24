import 'package:chance_app/ux/helpers/chat_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;

class RoomCubit extends Cubit<types.Room> {
  RoomCubit(this.room) : super(room);

  final types.Room room;

  void updateRoom(types.Room room) {
    ChatHelper.updateRoom(room);

    emit(room);
  }
}
