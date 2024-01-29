import 'package:dio/dio.dart';
import 'package:flutter_dio_example/core/constants/constants.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final homeRepositoryProvider = Provider(
  (ref) => HomeRepository(
    dio: Dio(),
  ),
);

class HomeRepository {
  final Dio dio;

  HomeRepository({required this.dio});

  Future<void> get() async {
    try {
      await dio.get(
        '$jsonPlaceholderBaseURL$jsonPlaceholderPosts',
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<void> post() async {
    try {
      await dio.post(
        'https://jsonplaceholder.typicode.com/posts',
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<void> put() async {
    try {
      await dio.put(
        'https://jsonplaceholder.typicode.com/posts',
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<void> delete() async {
    try {
      await dio.delete(
        'https://jsonplaceholder.typicode.com/posts',
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<void> patch() async {
    try {
      await dio.patch(
        'https://jsonplaceholder.typicode.com/posts',
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<void> head() async {
    try {
      await dio.head(
        'https://jsonplaceholder.typicode.com/posts',
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<void> download() async {
    try {
      await dio.download(
        'https://jsonplaceholder.typicode.com/posts',
        './',
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<void> request() async {
    try {
      await dio.request(
        'https://jsonplaceholder.typicode.com/posts',
        options: Options(
          method: 'GET',
        ),
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<void> requestWithData() async {
    try {
      await dio.request(
        'https://jsonplaceholder.typicode.com/posts',
        options: Options(
          method: 'GET',
        ),
        data: {
          'id': 1,
        },
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<void> requestWithQueryParameters() async {
    try {
      await dio.request(
        'https://jsonplaceholder.typicode.com/posts',
        options: Options(
          method: 'GET',
        ),
        queryParameters: {
          'id': 1,
        },
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<void> requestWithHeaders() async {
    try {
      await dio.request(
        'https://jsonplaceholder.typicode.com/posts',
        options: Options(
          method: 'GET',
          headers: {
            'Authorization': 'Bearer token',
          },
        ),
      );
    } catch (e) {
      rethrow;
    }
  }
}
