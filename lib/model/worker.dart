
import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

import '../utils/api_routes.dart';

class Worker with ChangeNotifier {
  String id;
  String userId;

  Worker({
    required this.id,
    required this.userId,
  });

  factory Worker.fromJson(Map<String, dynamic> json) {
    return Worker(
      id: json['id'].toString(),
      userId: json['userId'].toString()
    );
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
      id = worker.id;
      userId = worker.userId;
      notifyListeners();
    }
  }

  Future<String?> save(String token) async {
    final response = await http.post(Uri.parse(ApiRoutes.BASE_URL + ApiRoutes.WORKER),
        body: jsonEncode({
          "userId": int.parse(userId),
        }),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': "application/json"
        }
    );

    if (response.body.isNotEmpty) {
      Worker worker = Worker.fromJson(jsonDecode(response.body));
      return worker.id;
    } else {
      return null;
    }
  }
}