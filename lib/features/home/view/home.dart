import 'package:flutter/material.dart';
import 'package:flutter_dio_example/features/home/repository/home_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/post.dart';

class Home extends ConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pushNamed(context, "/delete-post"),
          icon: const Icon(Icons.delete),
        ),
        title: const Text('Flutter Dio Example'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () => Navigator.pushNamed(context, "/add-post"),
              icon: const Icon(Icons.add)),
          IconButton(
              onPressed: () => Navigator.pushNamed(context, "/put-post"),
              icon: const Icon(Icons.edit)),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FutureBuilder<List<Post>>(
                  future: ref.read(getPostsProvider.future),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      return const Center(child: Text('Error'));
                    } else {
                      return Expanded(
                        child: ListView.builder(
                          itemCount: snapshot.data.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Card(
                                child: ListTile(
                                  title: Text(snapshot.data[index].title),
                                  subtitle: Text(snapshot.data[index].body),
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
