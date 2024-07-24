import 'dart:typed_data';

import 'package:chance_app/ux/api/api_client.dart';

class FilesRepository {
  final _apiClient = const ApiClient();

  Future<Uint8List> getPrivacyPolicy() async {
    final bytes = await _apiClient.readBytes("/policy");
    return bytes;
  }
}
