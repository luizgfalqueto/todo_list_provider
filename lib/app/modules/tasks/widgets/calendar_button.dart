import 'package:flutter/material.dart';
import 'package:todo_list_provider/app/core/ui/them_extensions.dart';

class CalendarButton extends StatelessWidget {
  const CalendarButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 20,
      ),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(300)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.today,
            color: Colors.grey,
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            'SELECIONE UMA DATA',
            style: context.titleStyle.copyWith(fontSize: 14),
          )
        ],
      ),
    );
  }
}
