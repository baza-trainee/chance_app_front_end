import 'package:chance_app/ux/enum/instruction.dart';
import 'package:chance_app/ux/enum/medicine_type.dart';
import 'package:chance_app/ux/enum/periodicity.dart';
import 'package:chance_app/ux/model/medicine_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';

part 'add_medicine_event.dart';
part 'add_medicine_state.dart';
part 'add_medicine_bloc.freezed.dart';

class AddMedicineBloc extends Bloc<AddMedicineEvent, AddMedicineState> {
  AddMedicineBloc() : super(const AddMedicineState()) {
    on<SetName>(_onSetName);
    on<SetType>(_onSetType);
    on<SetPeriodicity>(_onSetPeriodicity);
    // on<SetDayPeriodicity>(_onSetDayPeriodicity);
    on<SetStartDate>(_onSetStartDate);
    on<AddWeekday>(_onAddWeekday);
    on<RemoveWeekday>(_onRemoveWeekday);
    on<AddDose>(_onAddDose);
    on<ChangeDose>(_onChangeDose);
    on<AddInstruction>(_onAddInstruction);
    on<SaveMedicine>(_onSaveMedicine);
  }

  void _onSetName(SetName event, Emitter<AddMedicineState> emit) {
    emit(state.copyWith(name: event.name));
  }

  void _onSetType(SetType event, Emitter<AddMedicineState> emit) {
    emit(state.copyWith(type: event.type));
  }

  void _onSetPeriodicity(SetPeriodicity event, Emitter<AddMedicineState> emit) {
    emit(state.copyWith(periodicity: event.periodicity));
  }

  // void _onSetDayPeriodicity(
  //     SetDayPeriodicity event, Emitter<AddMedicineState> emit) {
  //   emit(state.copyWith(dayPeriodicity: event.periodicity));
  // }

  void _onSetStartDate(SetStartDate event, Emitter<AddMedicineState> emit) {
    emit(state.copyWith(startDate: event.startDate));
  }

  void _onAddWeekday(AddWeekday event, Emitter<AddMedicineState> emit) {
    emit(
      state.copyWith(
        weekdays: Set.unmodifiable({
          ...state.weekdays,
          event.weekday,
        }),
      ),
    );
  }

  void _onRemoveWeekday(RemoveWeekday event, Emitter<AddMedicineState> emit) {
    emit(
      state.copyWith(
        weekdays: Set.unmodifiable(
          state.weekdays.where((item) => item != event.weekday),
        ),
      ),
    );
  }

  void _onAddDose(AddDose event, Emitter<AddMedicineState> emit) {
    emit(
      state.copyWith(
        doses: Map.unmodifiable({
          ...state.doses,
          event.time: event.count,
        }),
      ),
    );
  }

  void _onChangeDose(ChangeDose event, Emitter<AddMedicineState> emit) {
    final time = state.doses.keys.toList();
    final count = state.doses.values.toList();
    emit(
      state.copyWith(
        doses: Map.unmodifiable({
          for (var i = 0; i < state.doses.length; i++)
            if (i == event.index)
              event.time ?? time[i]: event.count ?? count[i]
            else
              time[i]: count[i],
        }),
      ),
    );
  }

  void _onAddInstruction(AddInstruction event, Emitter<AddMedicineState> emit) {
    emit(state.copyWith(instruction: event.instruction));
  }

  void _onSaveMedicine(SaveMedicine event, Emitter<AddMedicineState> emit) {
    if (state.type == null) throw ArgumentError("null", "type");
    if (state.periodicity == null) throw ArgumentError("null", "periodicity");
    if (state.startDate == null) throw ArgumentError("null", "startDate");
    emit(
      state.copyWith(
        medicine: MedicineModel(
          id: const Uuid().v1(),
          updatedAt: DateTime.now(),
          name: state.name,
          type: state.type!,
          periodicity: state.periodicity!,
          startDate: state.startDate!,
          weekdays: state.weekdays.toList(),
          doses: {
            for (final time in state.doses.keys)
              time.toTimeOffset(): state.doses[time]!,
          },
          instruction: state.instruction ?? Instruction.noMatter,
        ),
      ),
    );
  }
}
