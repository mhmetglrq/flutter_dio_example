import 'package:flutter/material.dart';
import 'package:flutter_dio_example/features/home/controller/home_controller.dart';
import 'package:flutter_dio_example/features/home/model/post.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PutPost extends StatelessWidget {
  const PutPost({super.key});

  @override
  Widget build(BuildContext context) {
    Post post = Post();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Put Post'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  onChanged: (value) {
                    post.id = int.parse(value);
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'id',
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  onChanged: (value) {
                    post.userId = int.parse(value);
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'UserID',
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  onChanged: (value) {
                    post.title = value;
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Title',
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  onChanged: (value) {
                    post.body = value;
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Body',
                  ),
                ),
                const SizedBox(height: 10),
                Consumer(
                  builder: (context, ref, child) {
                    return ElevatedButton(
                      onPressed: () {
                        ref.read(homeControllerProvider).put(post).then(
                              (value) => showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  title: const Text('Success'),
                                  content:
                                      const Text('Post updated successfully'),
                                  actions: [
                                    TextButton(
                                        onPressed: () => Navigator.pop(context),
                                        child: const Text('Ok'))
                                  ],
                                ),
                              ),
                            );
                      },
                      child: const Text('Put Post'),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
