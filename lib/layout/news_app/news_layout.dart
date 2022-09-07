import 'package:course/layout/news_app/cubit/cubit.dart';
import 'package:course/layout/news_app/cubit/states.dart';
import 'package:course/modules/news_app/search/search_screen.dart';
import 'package:course/shared/components/components.dart';
import 'package:course/shared/cubit/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class NewsLayout extends StatelessWidget {
  const NewsLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = NewsCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: const Text('News App'),
              actions: [
                IconButton(onPressed: ()
                {
                navigateTo(context, SearchScreen());
                }, icon: const Icon(Icons.search)),
                IconButton(
                    onPressed: ()
                    {
                      AppCubit.get(context).changeAppMode();
                    }
                    , icon: const Icon(Icons.brightness_4_outlined))
              ],
            ),
            body: cubit.screens[cubit.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.currentIndex,
              items: cubit.bottomItems,
              onTap: (index) {
                cubit.changeBottomNavBar(index);
              },
            ),
          );
        });
  }
}
