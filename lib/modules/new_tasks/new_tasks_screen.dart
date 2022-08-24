import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttercourse/shared/cubit/cubit.dart';
import 'package:fluttercourse/shared/cubit/states.dart';

import '../../shared/components/components.dart';

class NewTasksScreen extends StatelessWidget {
  const NewTasksScreen({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {

    return BlocConsumer<AppCubit, AppStates>(
      listener: ( context ,  state){},
      builder: (context, state)
      {
        var tasks = AppCubit.get(context).newTasks;
           return tasksBuilder(
          tasks: tasks,
        );
      },

    );
  }
}
