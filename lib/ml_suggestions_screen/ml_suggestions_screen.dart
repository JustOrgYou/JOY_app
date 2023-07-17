import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todo_app/ml_suggestions_screen/presentation/suggestion_card.dart';
import 'package:todo_app/task_edit/task_edit.dart';
import 'package:todo_app/tasks_service/data/task_providers.dart';
import 'package:todo_app/tasks_service/domain/task_entry.dart';

part 'ml_suggestions_screen.g.dart';

@riverpod
Future<List<List<TaskEntry>>> suggestionsDetail(
  Ref ref,
) async {
  // final tasks = await ref.watch(taskEntryStreamProvider.future);
  final emptyTask = TaskEntry.empty();
  final similarTasksA = [
    emptyTask.copyWith(
      title: 'task 1 title blah blah blah',
      description: 'some short desription',
    ),
    emptyTask.copyWith(
      title: 'task 2 title olla olla olla',
      description: 'regular description with\nmultiple lines\nand line breaks',
    ),
    emptyTask.copyWith(
      title: 'task 3 very long title blah blah blah olla olla olla',
      description: '''
lorem ipsum dolor sit amet, consectetur adipiscing elit,
sed do eiusmod tempor incididunt ut labore et
dolore magna aliqua. Ut enim ad minim veniam quis
nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.''',
    ),
  ];

  final similarTasksB = [
    emptyTask.copyWith(
      title: 'buy bread',
      description: 'some short desription',
    ),
    emptyTask.copyWith(
      title: 'buy tasty bread',
      description: '''
lorem ipsum dolor sit amet, consectetur adipiscing elit,
sed do eiusmod tempor incididunt ut labore et
dolore magna aliqua. Ut enim ad minim veniam quis
nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.''',
    ),
  ];

  final similarTasksC = [
    emptyTask.copyWith(
      title: 'find a girlfriend',
      description: 'some short desription',
    ),
    emptyTask.copyWith(
      title: '',
      description: 'some short desription',
    ),
    emptyTask.copyWith(
      title: 'task 1 title blah blah blah',
      description: 'some short desription',
    ),
    emptyTask.copyWith(
      title: 'task 1 title blah blah blah',
      description: 'some short desription',
    ),
    emptyTask.copyWith(
      title: 'task 2 title olla olla olla',
      description: 'regular description with\nmultiple lines\nand line breaks',
    ),
    emptyTask.copyWith(
      title: 'task 3 very long title blah blah blah olla olla olla',
      description: '''
lorem ipsum dolor sit amet, consectetur adipiscing elit,
sed do eiusmod tempor incididunt ut labore et
dolore magna aliqua. Ut enim ad minim veniam quis
nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.''',
    ),
  ];

  final suggestions = [similarTasksA, similarTasksB, similarTasksC];

  return suggestions;
}

class MlSwipeTree extends ConsumerWidget {
  const MlSwipeTree({
    super.key,
  });

  Future<void> mergeTasks(WidgetRef ref, List<TaskEntry> tasks) async {
    final taskEntryService = ref.read(taskEntryServiceProvider);
    final newEntry = TaskEntry.empty()
        .copyWith(title: tasks.map((e) => e.title).toSet().toList().join('\n'));

    tasks.map(taskEntryService.deleteTaskEntry);

    if (!ref.context.mounted) return;
    await Navigator.push<void>(
      ref.context,
      MaterialPageRoute(
        builder: (context) => TaskEdit(
          taskEntry: newEntry,
          onEditComplete: (updatedEntry) async {
            await taskEntryService.addTaskEntry(
              updatedEntry,
            );
            // ignore: use_build_context_synchronously
            if (!context.mounted) return;
            Navigator.pop(context);
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = AppinioSwiperController();
    final suggestionsDetail = ref.watch(suggestionsDetailProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Suggestions from AI',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ),
        ),
      ),
      body: suggestionsDetail.when(
        error: (error, stackTrace) {
          return Center(
            child: ListView(
              children: [
                Text('Error: $error'),
                const SizedBox(height: 20),
                Text(stackTrace.toString()),
              ],
            ),
          );
        },
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
        data: (suggestions) {
          if (suggestions.isEmpty) {
            return const Center(
              child: Text('No suggestions :)'),
            );
          }
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.55,
                  child: AppinioSwiper(
                    controller: controller,
                    cardsCount: suggestions.length,
                    onSwipe: (index, direction) async {
                      if (direction == AppinioSwiperDirection.right) {
                        await mergeTasks(ref, suggestions[index - 1]);
                      }
                    },
                    cardsBuilder: (BuildContext context, int index) {
                      return Container(
                        alignment: Alignment.center,
                        child: SuggestionCard(tasks: suggestions[index]),
                      );
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: controller.swipeLeft,
                      child: const Text('Discard'),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    TextButton(
                      onPressed: controller.swipeRight,
                      child: const Text('Merge'),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
