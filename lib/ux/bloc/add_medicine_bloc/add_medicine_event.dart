part of 'add_medicine_bloc.dart';

@freezed
class AddMedicineEvent with _$AddMedicineEvent {
  const factory AddMedicineEvent.setName(
    String name,
  ) = SetName;

  const factory AddMedicineEvent.setType(
    MedicineType type,
  ) = SetType;

  const factory AddMedicineEvent.setPeriodicity(
    Periodicity periodicity,
  ) = SetPeriodicity;

  // const factory AddMedicineEvent.setDayPeriodicity(
  //   DayPeriodicity periodicity,
  // ) = SetDayPeriodicity;

  const factory AddMedicineEvent.setStartDate(
    DateTime startDate,
  ) = SetStartDate;

  const factory AddMedicineEvent.addWeekday(
    int weekday,
  ) = AddWeekday;

  const factory AddMedicineEvent.removeWeekday(
    int weekday,
  ) = RemoveWeekday;

  const factory AddMedicineEvent.addDose(
    TimeOfDay time,
    int count,
  ) = AddDose;

  const factory AddMedicineEvent.changeDose({
    required int index,
    TimeOfDay? time,
    int? count,
  }) = ChangeDose;

  const factory AddMedicineEvent.addInstruction(
    Instruction instruction,
  ) = AddInstruction;

  const factory AddMedicineEvent.save() = SaveMedicine;
}
