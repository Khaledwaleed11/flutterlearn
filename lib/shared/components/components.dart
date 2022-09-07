

import 'package:course/layout/news_app/cubit/cubit.dart';
import 'package:course/layout/news_app/cubit/states.dart';
import 'package:course/modules/news_app/web_view/web_view_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/cubit.dart';

Widget buildTaskItem(Map model, context) {
  // debugPrint("Key           "+ model['id'].toString());

  return Dismissible(
    key: Key(model['id'].toString()),
    onDismissed: (direction) {
      AppCubit.get(context).deleteData(id: model['id']);
    },
    child: Padding(
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
              icon: const Icon(
                Icons.check_box,
                color: Colors.purple,
              )),
          IconButton(
              onPressed: () {
                AppCubit.get(context).updateData(
                  status: 'archive',
                  id: model['id'],
                );
              },
              icon: const Icon(
                Icons.archive_outlined,
                color: Colors.black38,
              )),
        ],
      ),
    ),
  );
}

  Widget buildArticleItem(article, context) =>  BlocConsumer<NewsCubit , NewsStates>(builder: (context, state) => InkWell(
    onTap: (){
      navigateTo(context, WebViewScreen(url: article['url']));
    },
    child: Padding(
    padding: const EdgeInsets.all(20),
    child: Row(
      children: [
        Container(
          width: 120,
          height: 120,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image:  DecorationImage(
                image: NetworkImage(
                    '${article['urlToImage']}'),
                fit: BoxFit.cover,
              )),
        ),
        const SizedBox(
          width: 20,
        ),
        Expanded(
          child: SizedBox(
            height: 120,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children:  [
                Expanded(
                  child: Text(
                    '${article['title']}',
                    style:Theme.of(context).textTheme.bodyText1,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Text(
                  '${article['publishedAt']}',
                  style:const TextStyle(
                    color: Colors.grey,
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    ),
),
  ), listener: (context, state) {},);
Future navigateTo(context ,widget ) =>  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => widget,
    ),);
Future navigateAndFinish(context ,widget ) =>  Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(
      builder: (context) => widget,
    ),
    (Route<dynamic> route) => false,
);



