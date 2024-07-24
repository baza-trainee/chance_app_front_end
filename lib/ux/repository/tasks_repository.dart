import 'dart:async';

import 'package:chance_app/ui/l10n/app_localizations.dart';
import 'package:chance_app/ux/api/api_client.dart';
import 'package:chance_app/ux/hive_crud.dart';
import 'package:chance_app/ux/model/task_model.dart';
import 'package:chance_app/ux/repository/user_repository.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hive/hive.dart';

class TasksRepository {
  final _apiClient = const ApiClient();
  final _userRepository = UserRepository();
  final Box<TaskModel> _storage = tasksBox;

  List<TaskModel> getLocalTasks() {
    return _storage.values.where((e) => !e.isRemoved).toList();
  }

  Future<Set<String>> syncTasks() async {
    final cookie = await _userRepository.getCookie();
    final fetchedItems = await _apiClient.fetchTasks(cookie: cookie.toString());
    if (fetchedItems == null) return {};
    _storage.clear();
    final result = <String>{};
    final syncMap = <String, ({TaskModel? local, TaskModel? remote})>{
      for (final item in fetchedItems) item.id: (local: null, remote: item),
    };
    for (final item in _storage.values) {
      syncMap[item.id] = (local: item, remote: syncMap[item.id]?.remote);
    }
    for (final item in syncMap.values) {
      final local = item.local;
      final remote = item.remote;
      if (local == null) {
        await _storage.putTask(remote!);
      } else if (remote == null) {
        if (!local.isRemoved) {
          final item = await _apiClient.postTask(
            local,
            cookie: cookie.toString(),
          );
          if (item == null) continue;
          await _storage.putTask(item);
        }
        await _storage.deleteTask(local);
        result.add(local.id);
      } else if (local.isRemoved) {
        final deleted = await _apiClient.deleteTask(
          remote,
          cookie: cookie.toString(),
        );
        if (!deleted) continue;
        await _storage.deleteTask(local);
        result.add(local.id);
      }
    }
    return result;
  }

  Future<TaskModel> addTask(TaskModel task) async {
    final cookie = await _userRepository.getCookie();
    final model = await _apiClient.postTask(
      task,
      cookie: cookie.toString(),
    );
    await _storage.putTask(task);
    return task;
  }

  Future<TaskModel> updateTask(TaskModel task) async {
    final cookie = await _userRepository.getCookie();
    final model = await _apiClient.patchTask(
      task,
      cookie: cookie.toString(),
    );
    await _storage.putTask(task);
    return task;
  }

  Future<bool> removeTask(TaskModel task) async {
    final cookie = await _userRepository.getCookie();
    final deleted = await _apiClient.deleteTask(
      task,
      cookie: cookie.toString(),
    );
    if (deleted) {
      await _storage.deleteTask(task);
    } else {
      task = task.copyWith(isRemoved: true);
      await _storage.putTask(task);
    }
    return deleted;
  }

  Future<void> deleteAllTasks() => _storage.clear();
}

extension _TasksStorage on Box<TaskModel> {
  Future<void> putTask(TaskModel item) => put(item.id, item);

  Future<void> deleteTask(TaskModel item) => delete(item.id);
}

extension _TasksClient on ApiClient {
  Future<List<TaskModel>?> fetchTasks({required String cookie}) async {
    if (await (Connectivity().checkConnectivity()) == ConnectivityResult.none) {
      Fluttertoast.showToast(
          msg: AppLocalizations.instance
              .translate("noInternetConnectionConnection"),
          toastLength: Toast.LENGTH_LONG);
      return null;
    } else {
      try {
        final items = await get("/task", cookie: cookie) as List<dynamic>?;
        return items?.cast<Map<String, dynamic>>().map(_modelFromJson).toList();
      } catch (e, trace) {
        FirebaseCrashlytics.instance.recordError(e.toString(), trace);
        return null;
      }
    }
  }

  Future<TaskModel?> postTask(
    TaskModel task, {
    required String cookie,
  }) async {
    if (await (Connectivity().checkConnectivity()) == ConnectivityResult.none) {
      Fluttertoast.showToast(
          msg: AppLocalizations.instance
              .translate("noInternetConnectionConnection"),
          toastLength: Toast.LENGTH_LONG);
      return null;
    } else {
      try {
        final json = await post(
          "/task",
          cookie: cookie,
          json: _modelToJson(task),
        ) as Map<String, dynamic>?;
        if (json == null) {
          return null;
        }
        return _modelFromJson(json);
      } catch (e, trace) {
        FirebaseCrashlytics.instance.recordError(e.toString(), trace);
        return null;
      }
    }
  }

  Future<TaskModel?> patchTask(
    TaskModel task, {
    required String cookie,
  }) async {
    if (await (Connectivity().checkConnectivity()) == ConnectivityResult.none) {
      Fluttertoast.showToast(
          msg: AppLocalizations.instance
              .translate("noInternetConnectionConnection"),
          toastLength: Toast.LENGTH_LONG);
      return null;
    } else {
      try {
        final json = await patch(
          "/task/${task.id}",
          cookie: cookie.toString(),
          json: _modelToJson(task),
        ) as Map<String, dynamic>?;
        if (json == null) {
          return null;
        }
        return _modelFromJson(json);
      } catch (e, trace) {
        FirebaseCrashlytics.instance.recordError(e.toString(), trace);
        return null;
      }
    }
  }

  Future<bool> deleteTask(
    TaskModel task, {
    required String cookie,
  }) async {
    if (await (Connectivity().checkConnectivity()) == ConnectivityResult.none) {
      Fluttertoast.showToast(
          msg: AppLocalizations.instance
              .translate("noInternetConnectionConnection"),
          toastLength: Toast.LENGTH_LONG);
      return false;
    } else {
      try {
        await delete(
          "/task/${task.id}",
          cookie: cookie.toString(),
        );
        return true;
      } catch (e, trace) {
        FirebaseCrashlytics.instance.recordError(e.toString(), trace);
        return false;
      }
    }
  }

  Map<String, dynamic> _modelToJson(TaskModel task) => {
        "message": task.message,
        "date": task.date.toUtc().toString(),
        "isDone": task.isDone,
        "remindBefore": task.remindBefore,
      };

  TaskModel _modelFromJson(Map<String, dynamic> json) =>
      TaskModel.fromJson(json);
}
