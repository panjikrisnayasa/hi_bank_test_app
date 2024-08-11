import 'package:flutter/material.dart';
import 'package:hi_bank_test_app/app/data/posts/model/post_response.dart';
import 'package:hi_bank_test_app/app/localizations/localizations_extension.dart';

class PostCard extends StatelessWidget {
  const PostCard({
    super.key,
    required this.data,
  });

  final PostResponse data;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.only(
          left: 12,
          right: 12,
          top: 12,
          bottom: 16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('${context.localizations.userId}: ${data.userId}'),
            const SizedBox(height: 8),
            Text('${context.localizations.postId}: ${data.id}'),
            const SizedBox(height: 8),
            Text(
              data.title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 8),
            Text(data.body),
          ],
        ),
      ),
    );
  }
}
