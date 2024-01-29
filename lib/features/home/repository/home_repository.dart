import 'package:dio/dio.dart';
import 'package:flutter_dio_example/core/constants/constants.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/post.dart';

final getPostsProvider = FutureProvider.autoDispose<List<Post>>((ref) async {
  try {
    return await ref.read(homeRepositoryProvider).get();
  } catch (e) {
    rethrow;
  }
});

final homeRepositoryProvider = Provider(
  (ref) => HomeRepository(
    dio: Dio(),
  ),
);

class HomeRepository {
  final Dio dio;

  HomeRepository({required this.dio});

  Future<List<Post>> get() async {
    List<Post> posts = [];
    try {
      final response = await dio.get(
        '$jsonPlaceholderBaseURL$jsonPlaceholderPosts',
      );
      for (final post in response.data) {
        posts.add(Post.fromJson(post));
      }
    } catch (e) {
      rethrow;
    }
    return posts;
  }

  Future<Post> post(Post post) async {
    try {
      final response = await dio.post(
        '$jsonPlaceholderBaseURL$jsonPlaceholderPosts',
        data: post.toJson(),
      );
      return Post.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> put(Post post) async {
    try {
      await dio.put(
        '$jsonPlaceholderBaseURL$jsonPlaceholderPosts/${post.id}',
        data: post.toJson(),
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<void> delete(int id) async {
    try {
      await dio.delete(
        '$jsonPlaceholderBaseURL$jsonPlaceholderPosts/$id',
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
}
