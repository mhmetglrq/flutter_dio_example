import 'package:flutter/material.dart';
import 'package:flutter_dio_example/config/routes/app_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'features/home/view/home.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      onGenerateRoute: AppRouter.onGenerateRoutes,
      home: const Home(),
    );
  }
}
