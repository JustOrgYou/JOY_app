import 'package:flutter/material.dart';

class AppDropownButton<T> extends StatelessWidget {
  final String title;
  final List<T> items;
  final String Function(T) itemToString;
  final Color? Function(T)? itemToColor;

  const AppDropownButton({
    required this.choosedValue,
    required this.title,
    required this.items,
    required this.itemToString,
    super.key,
    this.itemToColor,
  });

  final ValueNotifier<T> choosedValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        DropdownButtonHideUnderline(
          child: DropdownButton<T>(
            iconSize: 0,
            value: choosedValue.value,
            items: items
                .map<DropdownMenuItem<T>>(
                  (priority) => DropdownMenuItem(
                    value: priority,
                    child: Text(
                      itemToString(priority),
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: itemToColor?.call(priority),
                          ),
                    ),
                  ),
                )
                .toList(),
            onChanged: (priority) {
              if (priority == null) return;
              choosedValue.value = priority;
            },
          ),
        ),
      ],
    );
  }
}
