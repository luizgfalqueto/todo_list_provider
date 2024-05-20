import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:todo_list_provider/app/core/ui/them_extensions.dart';
import 'package:todo_list_provider/app/modules/home/widgets/todo_card_filter.dart';

class HomeFilters extends StatefulWidget {
  const HomeFilters({super.key});

  @override
  State<HomeFilters> createState() => _HomeFiltersState();
}

class _HomeFiltersState extends State<HomeFilters> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'FILTROS',
          style: context.titleStyle,
        ),
        const SizedBox(
          height: 10,
        ),
        const SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              TodoCardFilter()
            ],
          ),
        )
      ],
    );
  }
}
