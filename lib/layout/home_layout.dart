import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttercourse/modules/archived_tasks/archived_tasks_screen.dart';
import 'package:fluttercourse/modules/done_tasks/done_tasks_screen.dart';
import 'package:fluttercourse/modules/new_tasks/new_tasks_screen.dart';
import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';

class HomeLayOut extends StatefulWidget {
  const HomeLayOut({Key? key}) : super(key: key);

  @override
  State<HomeLayOut> createState() => _HomeLayOutState();
}

class _HomeLayOutState extends State<HomeLayOut> {
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
  late Database database;
  var scaffoldkey = GlobalKey<ScaffoldState>();
  bool isBottomSheetShown = false;
  IconData fabIcon = Icons.edit;
  var titlecontroller = TextEditingController();
  var timecontroller = TextEditingController();
  var formkey = GlobalKey<FormState>();
  var datecontroller = TextEditingController();

  @override
  void initState() {
    super.initState();
    createDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldkey,
      appBar: AppBar(
        title: Text(
          titles[currentIndex],
        ),
      ),
      body: screens[currentIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (isBottomSheetShown) {
            if (formkey.currentState!.validate()) {
            insertToDatabase(
              date: datecontroller,
              time: timecontroller,
              title: titlecontroller,

            ).then((value)
            {
              Navigator.pop(context);
              isBottomSheetShown = false;
              setState(() {
                fabIcon = Icons.edit;
              });
            });
            }

          } else {
            scaffoldkey.currentState?.showBottomSheet((context) => Container(
                  color: Colors.grey[300],
                  padding: const EdgeInsets.all(20),
                  child: Form(
                    key: formkey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextFormField(
                          controller: titlecontroller,
                          keyboardType: TextInputType.text,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'title must not be empty';
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Task Title',
                            prefixIcon: Icon(Icons.title),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          controller: timecontroller,
                          // keyboardType: TextInputType.datetime,
                          readOnly: true,
                          showCursor: true,
                          onTap: () {
                            showTimePicker(
                                    context: context,
                                    initialTime: TimeOfDay.now())
                                .then((value) {
                              timecontroller.text =
                                  value!.format(context).toString();
                              print(value.format(context));
                            });
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'time must not be empty';
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Task Time',
                            prefixIcon: Icon(Icons.watch_later_outlined),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          controller: datecontroller,
                          keyboardType: TextInputType.datetime,
                          readOnly: true,
                          showCursor: true,
                          onTap: () {
                            showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime.now(),
                              lastDate: DateTime(2022,09,18),
                            ).then((value) {
                              print(DateFormat.yMMMd().format(value!));
                              datecontroller.text =
                                  DateFormat.yMMMd().format(value);
                            });
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'date must not be empty';
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Task Date',
                            prefixIcon: Icon(Icons.calendar_today),
                          ),
                        ),
                      ],
                    ),
                  ),
                ));
            isBottomSheetShown = true;
            setState(() {
              fabIcon = Icons.add;
            });
          }
        },
        child: Icon(fabIcon),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'Tasks'),
          BottomNavigationBarItem(
              icon: Icon(Icons.check_circle), label: 'Done'),
          BottomNavigationBarItem(
              icon: Icon(Icons.archive_outlined), label: 'Archived'),
        ],
      ),
    );
  }

  Future<String> getName() async {
    return 'Ahmed Ali';
  }

  Future createDatabase() async {
     database = await openDatabase(
      'todo.db',
      version: 1,
      onCreate: (database, version) {
        if (kDebugMode) {
          print('database created');
        }
        database
            .execute(
                'CREATE TABLE tasks(id INTEGER PRIMARY KEY , title TEXT ,date TEXT ,time TEXT ,status TEXT)')
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
      onOpen: (database) {
        if (kDebugMode) {
          print('database opened');
        }
      },
    );
  }

  Future insertToDatabase({required title,
    required time,
    required date,
  }
      ) async {
    await createDatabase();
    return await database.transaction((txn)  => txn
          .rawInsert(
              'INSERT INTO tasks (title,date,time,status) VALUES("$title", "$time", "$date","new"')
          .then((value) {
        if (kDebugMode) {
          print('inserted successfully');
        }
      }).catchError((error) {
        if (kDebugMode) {
          print('error when inserting new record ${error.toString()}');
        }
      }));
  }
}
