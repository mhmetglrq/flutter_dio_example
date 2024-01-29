import 'package:flutter/material.dart';
import 'package:flutter_dio_example/features/home/view/add_post.dart';
import 'package:flutter_dio_example/features/home/view/delete_post.dart';
import 'package:flutter_dio_example/features/home/view/put_post.dart';

import '../../features/home/view/home.dart';

class AppRouter {
  static Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return _materialRoute(const Home());

      case '/add-post':
        return _materialRoute(const AddPost());

      case '/delete-post':
        return _materialRoute(const DeletePost());

      case '/put-post':
        return _materialRoute(const PutPost());

      default:
        return _materialRoute(const Home());
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }
}
