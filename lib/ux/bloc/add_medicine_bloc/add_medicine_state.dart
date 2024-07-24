part of 'add_medicine_bloc.dart';

@freezed
class AddMedicineState with _$AddMedicineState {
  const factory AddMedicineState({
    @Default('') String name,
    MedicineType? type,
    Periodicity? periodicity,
    // DayPeriodicity? dayPeriodicity,
    DateTime? startDate,
    @Default({}) Set<int> weekdays,
    @Default({}) Map<TimeOfDay, int> doses,
    Instruction? instruction,
    MedicineModel? medicine,
  }) = _State;

  const AddMedicineState._();

  List<bool> get completedSteps => [
        name.isNotEmpty,
        type != null,
        periodicity != null,
        // dayPeriodicity != null,
        if (periodicity == Periodicity.certainDays) weekdays.isNotEmpty,
        startDate != null,
        doses.isNotEmpty,
        instruction != null,
      ];

  double get progress =>
      completedSteps.where((isDone) => isDone == true).length /
      completedSteps.length;
}
