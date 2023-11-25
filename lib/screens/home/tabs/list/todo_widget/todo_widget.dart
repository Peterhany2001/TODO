import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo/moodels/todoDM.dart';
import 'package:todo/ui/utilts/AppTheme.dart';
import 'package:todo/ui/utilts/app_colors.dart';

class TodoWidget extends StatelessWidget {
  final TodoDM model;

  const TodoWidget({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24), color: AppColors.white),
      margin: const EdgeInsets.symmetric(vertical: 22, horizontal: 30),
      child: Slidable(
        startActionPane: ActionPane(
            motion: const StretchMotion(),
            extentRatio: .3,
            children: [
              SlidableAction(
                onPressed: (_) {},
                backgroundColor: const Color(0xFFFE4A49),
                foregroundColor: AppColors.white,
                icon: Icons.delete,
                label: 'Delete',
              ),
            ]),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
          height: MediaQuery.of(context).size.height * .13,
          child: Row(
            children: [
              const VerticalDivider(),
              const SizedBox(
                width: 12,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      model.title,
                      style: AppTheme.taskTitleTextStyle,
                    ),
                    Text(model.description,
                        style: AppTheme.taskDescriptionTextStyle),
                  ],
                ),
              ),
              Container(
                  decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(10)),
                  padding:
                      const EdgeInsets.symmetric(vertical: 6, horizontal: 20),
                  child: const Icon(
                    Icons.check,
                    color: AppColors.white,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
