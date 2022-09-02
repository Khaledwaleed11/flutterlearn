import 'package:course/layout/news_app/cubit/cubit.dart';
import 'package:course/layout/news_app/cubit/states.dart';
import 'package:course/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({Key? key}) : super(key: key);
  var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var List = NewsCubit.get(context).search;
        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextFormField(
                  controller: searchController,
                  keyboardType: TextInputType.text,
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return 'search must not be empty';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    NewsCubit.get(context).getSearch(value);
                  },
                  decoration: const InputDecoration(
                    labelText: 'Search',
                    prefixIcon: Icon(Icons.search),
                  ),
                ),
              ),
              BlocConsumer<NewsCubit, NewsStates>(
                  builder: (context, state) {
                    return state is! NewsGetSearchLoadingState
                        ? Expanded(
                          child: ListView.builder(
                              physics: const BouncingScrollPhysics(),
                              itemBuilder: (context, index) => buildArticleItem(
                                  NewsCubit.get(context).search[index],
                                  context),
                              itemCount:NewsCubit.get(context).search.length ),
                        )
                        : const Center(
                            child: CircularProgressIndicator(),
                          );
                  },
                  listener: (context, state) {}),
            ],
          ),
        );
      },
    );
  }
}
