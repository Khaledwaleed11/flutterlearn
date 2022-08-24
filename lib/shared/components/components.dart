import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:fluttercourse/shared/cubit/cubit.dart';

Widget buildTaskItem(Map model, context) => Dismissible(
 key: key(model['id']),
  onDismissed: (direction)
  {
    AppCubit.get(context).deleteData(id: model['id']);
  },
  child:   Padding(
  
        padding: const EdgeInsets.all(20.0),
  
        child: Row(
  
          children: [
  
            CircleAvatar(
  
              radius: 40,
  
              child: Text('${model['time']}'),
  
            ),
  
            const SizedBox(
  
              width: 20,
  
            ),
  
            Expanded(
  
              child: Column(
  
                mainAxisSize: MainAxisSize.min,
  
                crossAxisAlignment: CrossAxisAlignment.start,
  
                children: [
  
                  Text(
  
                    ' ${model['title']}',
  
                    style: const TextStyle(
  
                      fontSize: 20,
  
                      fontWeight: FontWeight.bold,
  
                    ),
  
                  ),
  
                  Text(
  
                    '${model['date']}',
  
                    style: const TextStyle(
  
                      color: Colors.grey,
  
                    ),
  
                  ),
  
                ],
  
              ),
  
            ),
  
            const SizedBox(
  
              width: 20,
  
            ),
  
            IconButton(
  
                onPressed: () {
  
                  AppCubit.get(context).updateData(
  
                    status: 'done',
  
                    id: model['id'],
  
                  );
  
                },
  
                icon: Icon(
  
                  Icons.check_box,
  
                  color: Colors.purple,
  
                )),
  
            IconButton(
  
                onPressed: ()
  
                {
  
                  AppCubit.get(context).updateData(
  
                    status: 'archive',
  
                    id: model['id'],
  
                  );
  
                },
  
                icon: Icon(
  
                  Icons.archive_outlined,
  
                  color: Colors.black38,
  
                )),
  
          ],
  
        ),
  
      ),
);

key(model) {
}
Widget tasksBuilder({
  required List<Map> tasks ,
})=>  ConditionalBuilder(
  condition: tasks.length> 0 ,
  builder: (context) => ListView.separated(
    itemBuilder: (context,index) => buildTaskItem(tasks[index], context),
    separatorBuilder: (context,index) => Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        width: double.infinity,
        height: 1,
        color: Colors.grey[300],
      ),
    ),
    itemCount: tasks.length,
  ),
  fallback: (context) => Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.menu,
          size: 70,
          color: Colors.grey,
        ),
        Text('no tasks yet please add some tasks',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.grey,

          ),
        ),
      ],
    ),
  ),
);

