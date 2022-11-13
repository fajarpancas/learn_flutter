import 'dart:convert';

import 'package:first_flutter/model/paginator.dart';
import 'package:first_flutter/model/post_result.dart';
import 'package:first_flutter/model/user.dart';
import 'package:first_flutter/model/users.dart';
import 'package:http/http.dart' as http;

class Api {
  final String _baseUrl = 'reqres.in';
  final String _endPoint = '/api/users';

  Future postUser(String name, String job) async {
    try {
      final response = await http.post(Uri.https(_baseUrl, _endPoint),
          body: {"name": name, "job": job});

      if (response.statusCode == 201) {
        var responseBody = response.body;
        PostResult postResult =
            PostResult.createPostResult(jsonDecode(responseBody));
        return postResult;
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future getUsers(String page) async {
    try {
      final response = await http.get(Uri.https(
          _baseUrl, _endPoint, {'page': page, 'per_page': '8', 'delay': '3'}));

      if (response.statusCode == 200) {
        var responseBody = response.body;
        Iterable it = jsonDecode(responseBody)['data'];
        List<User> users = it.map((e) => User.fromJson(e)).toList();
        Paginator paginator = Paginator.fromJson(jsonDecode(responseBody));
        Users objectData = Users.createData(paginator, users);
        return objectData;
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
