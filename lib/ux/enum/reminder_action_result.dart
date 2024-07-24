import 'package:flutter/material.dart' show IconData, Icons;

enum ReminderState {
  deleted,
  done,
  missed,
  rescheduled;

  IconData get icon {
    switch (this) {
      case ReminderState.deleted:
        return Icons.delete_forever;
      case ReminderState.done:
        return Icons.check;
      case ReminderState.missed:
        return Icons.close;
      case ReminderState.rescheduled:
        return Icons.alarm;
    }
  }
}
