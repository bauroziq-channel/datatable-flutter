import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:youtube_tutorial/user.dart';

class Repository {
  Future<Either<User, Failure>> getUsers() async {
    try {
      final response = await http.get(Uri.parse(
          'https://60fec25a2574110017078789.mockapi.io/api/v1/users/1'));

      if (response.statusCode == 200) {
        return Left(User.fromJson(json.decode(response.body)));
      } else {
        return Right(Failure(message: 'Data gagal didapatkan.'));
      }
    } catch (e) {
      print(e);
      return Right(Failure(message: 'Data gagal didapatkan.'));
    }
  }
}

class Failure {
  String? message;
  Failure({this.message});
}
