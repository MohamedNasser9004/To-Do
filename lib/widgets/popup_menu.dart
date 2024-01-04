import 'package:flutter/material.dart';

import '../model/task.dart';

class PopupMenu extends StatelessWidget {
  const PopupMenu({super.key,
    required this.cancelOrDeleteCallback,
    required this.task,
    required this.likeOrUnlikeCallback,
    required this.editTaskCallBack,
    required this.restoreTaskCallBack});

  final VoidCallback cancelOrDeleteCallback;
  final VoidCallback likeOrUnlikeCallback;
  final VoidCallback editTaskCallBack;
  final VoidCallback restoreTaskCallBack;
  final Task task;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
        itemBuilder: task.isDelete == false
            ? ((context) =>
        [
          PopupMenuItem(
            child: TextButton.icon(
              onPressed: editTaskCallBack,
              icon: const Icon(Icons.edit),
              label: const Text('Edit'),
            ),
          ),
          PopupMenuItem(
            onTap: likeOrUnlikeCallback,
            child: TextButton.icon(
              onPressed: null,
              icon: task.isFavorite == false
                  ? const Icon(Icons.bookmark_add_outlined)
                  : const Icon(Icons.bookmark_remove),
              label: task.isFavorite == false
                  ? const Text('Add to \nBookmark')
                  : const Text('Remove from \nBookmark'),
            ),
          ),
          PopupMenuItem(
              onTap: cancelOrDeleteCallback,
              child: TextButton.icon(
                onPressed: null,
                icon: const Icon(Icons.delete),
                label: const Text('Delete'),
              ),
          ),
        ])
            : (context) =>
        [
          PopupMenuItem(
            onTap: restoreTaskCallBack,
            child: TextButton.icon(
              onPressed: null,
              icon: const Icon(Icons.restore_from_trash),
              label: const Text('Restore'),
            ),
          ),
          PopupMenuItem(
            onTap:
              cancelOrDeleteCallback,
            child: TextButton.icon(
              onPressed: null,
              icon: const Icon(Icons.delete_forever),
              label: const Text('Delete away'),
            ),
          ),
        ]);
  }
}
