import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../model/cat_model.dart';

abstract class BaseCatRepository {
  Future<List<CatModel>> getCats();
}

class CatRepository implements BaseCatRepository {
  static const _baseUrl = "https://hwasampleapi.firebaseio.com/http.json1";

  @override
  Future<List<CatModel>> getCats() async {
    final response = await http.get(Uri.parse(_baseUrl));

    switch (response.statusCode) {
      case HttpStatus.ok:
        final jsonBody = jsonDecode(response.body) as List;
        return jsonBody.map((e) => CatModel.fromJson(e)).toList();

      default:
        throw (NetworkError(
          message: "",
          statusCode: response.statusCode,
        ));
    }
  }
}

class NetworkError implements Exception {
  final int statusCode;
  final String message;
  NetworkError({
    required this.message,
    required this.statusCode,
  });
}
