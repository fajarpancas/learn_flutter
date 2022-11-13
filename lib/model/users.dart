import 'package:first_flutter/model/paginator.dart';
import 'package:first_flutter/model/user.dart';

class Users {
  Paginator pagination;
  List<User> data;

  Users({required this.pagination, required this.data});

  factory Users.createData(Paginator pagination, List<User> users) {
    return Users(pagination: pagination, data: users);
  }
}
