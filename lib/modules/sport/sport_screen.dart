import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../layout/news_app/cubit/cubit.dart';
import '../../layout/news_app/cubit/states.dart';
import '../../shared/components/components.dart';

class SportsScreen extends StatelessWidget {
  const SportsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>
      (
        builder: (context, state) {
          return NewsCubit.get(context).sports.isNotEmpty? ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context,index) => buildArticleItem(NewsCubit.get(context).sports[index], context),
              // separatorBuilder: (context,index) => ,
              itemCount: 10):const Center(child: CircularProgressIndicator(),);
        },
        listener: (context, state) {}
    );  }
}
