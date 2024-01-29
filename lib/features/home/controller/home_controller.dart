import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../repository/home_repository.dart';

final homeControllerProvider = Provider(
  (ref) => HomeController(
    homeRepository: ref.watch(homeRepositoryProvider),
  ),
);

class HomeController {
  final HomeRepository homeRepository;

  HomeController({required this.homeRepository});

  Future<void> get() async {
    try {
      await homeRepository.get();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> post() async {
    try {
      await homeRepository.post();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> put() async {
    try {
      await homeRepository.put();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> delete() async {
    try {
      await homeRepository.delete();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> patch() async {
    try {
      await homeRepository.patch();
    } catch (e) {
      rethrow;
    }
  }
}
