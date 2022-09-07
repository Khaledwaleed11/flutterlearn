
import 'package:course/layout/news_app/cubit/cubit.dart';
import 'package:course/layout/news_app/cubit/states.dart';
import 'package:course/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScienceScreen extends StatelessWidget {
  const ScienceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
        builder: (context, state) {
          return NewsCubit.get(context).science.isNotEmpty
              ? ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) =>
                      buildArticleItem(NewsCubit.get(context).science[index] , context),
                  // separatorBuilder: (context,index) => ,
                  itemCount: 10)
              : const Center(
                  child: CircularProgressIndicator(),
                );
        },
        listener: (context, state) {});
  }
}
