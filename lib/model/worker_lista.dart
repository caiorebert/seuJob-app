
import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:seujobapp/model/worker.dart';

import '../utils/api_routes.dart';

class WorkerLista with ChangeNotifier {
  late Worker _worker = Worker(id: '', userId: '');

  Worker get worker {
    return _worker;
  }

  Future<void> getWorkerbyId(String id, String token) async {
    final response = await http.get(Uri.parse(ApiRoutes.BASE_URL + ApiRoutes.WORKER_BY_USER_ID + id),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': "application/json"
        }
    );
    if (response.body.isNotEmpty) {
      Worker worker = Worker.fromJson(jsonDecode(response.body));
      worker.userId = id;
      _worker = worker;
      notifyListeners();
    }
  }

  Future<void> save(String id, String token) async {
    final response = await http.post(Uri.parse(ApiRoutes.BASE_URL + ApiRoutes.WORKER),
        body: jsonEncode({
          "userId": int.parse(id),
        }),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': "application/json"
        }
    );

    if (response.body.isNotEmpty) {
      Worker worker = Worker.fromJson(jsonDecode(response.body));
      _worker = worker;
      notifyListeners();
    }
  }
}