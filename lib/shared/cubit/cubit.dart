import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttercourse/shared/cubit/states.dart';
import 'package:sqflite/sqflite.dart';

import '../../modules/archived_tasks/archived_tasks_screen.dart';
import '../../modules/done_tasks/done_tasks_screen.dart';
import '../../modules/new_tasks/new_tasks_screen.dart';

class AppCubit extends Cubit<AppStates>
{
  AppCubit() :super(AppInitialState());
  static AppCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  List<Widget> screens = [
    const NewTasksScreen(),
    const DoneTasksScreen(),
    const ArchivedTasksScreen(),
  ];
  List<String> titles = [
    'New Tasks',
    'Done Tasks',
    'Archived Tasks',
  ];
  void changeIndex(int index)
  {
    currentIndex = index;
    emit(AppChangeBottomNavBarState());
  }
  late Database database;
  List<Map> newTasks =[];
  List<Map> doneTasks =[];
  List<Map> archivedTasks =[];

  Future createDatabase() async  {
   await openDatabase(
      'todo.db',
      version: 1,
      onCreate: (database, version) {
        if (kDebugMode) {
          print('database created');
        }
        database
            .execute(
            'CREATE TABLE tasks(id INTEGER PRIMARY KEY AUTOINCREMENT , title TEXT ,date TEXT ,time TEXT ,status TEXT)')
            .then((value) {
          if (kDebugMode) {
            print('table created');
          }
        }).catchError((error) {
          if (kDebugMode) {
            print('error when creating table ${error.toString()}');
          }
        });
      },
      onOpen: (database) 
      {
        getDataFromDatabase(database);
      },
    ).then((value) {
      database = value;
      emit(AppCreateDatabaseState());
    });
  }

   insertToDatabase({
    required title,
    required time,
    required date,
  }) async {
    await createDatabase();
    return await database.transaction((txn) => txn.rawInsert(
      ' INSERT INTO tasks (id,title,date,time,status) VALUES(5,"$title", "$date", "$time","new")',
    ).then((value) {
      if (kDebugMode) {
        print(' $value inserted successfully');
        emit(AppInsertToDatabaseState());
        getDataFromDatabase(database);
      }
    }).catchError((error) {
      if (kDebugMode) {
        print('error when inserting new record ${error.toString()}');
      }
    }));
  }

  void getDataFromDatabase(database)  {
    newTasks = [];
    doneTasks = [];
    archivedTasks = [];
    emit(AppGetDatabaseLoadingState());
     database.rawQuery('SELECT * FROM tasks').then((value) {

       value.forEach((element) {
        if(element['status'] == 'new')
          newTasks.add(element);
        else if (element['status'] == 'done')
          doneTasks.add(element);
        else archivedTasks.add(element);
       });
       emit(AppGetDatabaseState());
     });
  }
  bool isBottomSheetShown = false;
  IconData fabIcon = Icons.edit;
  void updateData ({
  required String status,
  required int id,
})

  async
  {
    database.rawUpdate(
        'UPDATE tasks SET status = ?,  WHERE id = ?',
        ['$status', id]).then((value) {
          getDataFromDatabase(database);
          emit(AppUpdateDatabaseState());
    });
  }
  void deleteData ({

    required int id,
  })

  async
  {
    database.rawDelete(
        'DELETE FROM tasks WHERE id = ?', [id],
       ).then((value) {
      getDataFromDatabase(database);
      emit(AppDeleteDatabaseState());
    });
  }

  void changeBottomSheetState({
  required bool isShow,
  required IconData icon,
})
  {
    isBottomSheetShown = isShow;
    fabIcon = icon;
    emit(AppChangeBottomSheetState());
  }
}