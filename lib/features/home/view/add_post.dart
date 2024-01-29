import 'package:flutter/material.dart';
import 'package:flutter_dio_example/features/home/model/post.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../controller/home_controller.dart';

class AddPost extends StatefulWidget {
  const AddPost({super.key});

  @override
  State<AddPost> createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
  Post post = Post();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Post'),
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
                      onPressed: () async {
                        ref
                            .read(homeControllerProvider)
                            .post(post)
                            .whenComplete(
                              () => showBottomSheet(
                                context: context,
                                builder: (context) => const Text('Post Added'),
                              ),
                            );
                      },
                      child: const Text('Submit'),
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
