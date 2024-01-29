import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/post.dart';
import '../repository/home_repository.dart';

final homeControllerProvider = Provider(
  (ref) => HomeController(
    homeRepository: ref.watch(homeRepositoryProvider),
    ref: ref,
  ),
);

class HomeController {
  final HomeRepository homeRepository;
  final ProviderRef ref;
  HomeController({required this.homeRepository, required this.ref});

  Future<List<Post>> get() async {
    try {
      return await homeRepository.get();
    } catch (e) {
      rethrow;
    }
  }

  Future<Post> post(Post post) async {
    try {
      return await homeRepository.post(post);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> put(Post post) async {
    try {
      await homeRepository
          .put(post)
          .whenComplete(() => ref.refresh(getPostsProvider));
    } catch (e) {
      rethrow;
    }
  }

  Future<void> delete(int id) async {
    try {
      await homeRepository.delete(id);
    } catch (e) {
      rethrow;
    }
  }
}
