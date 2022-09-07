import 'package:course/conditional_builder.dart';
import 'package:course/shared/components/components.dart';
import 'package:course/shared/cubit/cubit.dart';
import 'package:course/shared/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ArchivedTasksScreen extends StatelessWidget {
  const ArchivedTasksScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var tasks = AppCubit.get(context).archivedTasks;
        return ConditionalBuilder(
            condition: tasks.isNotEmpty,
            builder: ListView.separated(
              itemBuilder: (context, index) =>
                  buildTaskItem(tasks[index], context),
              separatorBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  width: double.infinity,
                  height: 1,
                  color: Colors.grey[300],
                ),
              ),
              itemCount: tasks.length,
            ),
            fallBack: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.menu,
                    size: 70,
                    color: Colors.grey,
                  ),
                  Text(
                    'no tasks yet please add some tasks',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ));
      },
    );
  }
}
