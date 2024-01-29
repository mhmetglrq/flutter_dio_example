import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../controller/home_controller.dart';
import '../model/post.dart';

class DeletePost extends StatelessWidget {
  const DeletePost({super.key});

  @override
  Widget build(BuildContext context) {
    Post post = Post();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Delete Post'),
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
                Consumer(
                  builder: (context, ref, child) {
                    return ElevatedButton(
                      onPressed: () {
                        if (post.id != null) {
                          ref
                              .read(homeControllerProvider)
                              .delete(post.id!)
                              .then(
                                (value) => showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    title: const Text('Success'),
                                    content:
                                        const Text('Post deleted successfully'),
                                    actions: [
                                      TextButton(
                                          onPressed: () =>
                                              Navigator.pop(context),
                                          child: const Text('Ok'))
                                    ],
                                  ),
                                ),
                              );
                        }
                      },
                      child: const Text('Delete'),
                    );
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
