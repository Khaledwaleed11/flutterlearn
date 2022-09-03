import 'package:course/layout/news_app/news_layout.dart';
import 'package:course/layout/todo_app/todo_layout.dart';
import 'package:course/modules/bmi/bmi_screen.dart';
import 'package:course/modules/counter/counter_screen.dart';
import 'package:course/shared/components/components.dart';
import 'package:flutter/material.dart';

class MyApps extends StatelessWidget {
  const MyApps({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.deepOrange,
        title:const Text('My Apps',
        style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        ),

      ),

      body: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
         children:   [
        Card(
          elevation: 10,
          color: Colors.deepOrange,
          child: InkWell(

            onTap: ()
            {
              navigateTo(context, const BmiScreen());
            },
            child:const Text('BMI App',
            style:  TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,

            ),
            ),
          ),
        )  ,
         const SizedBox(
          height: 30,
        ),
           Card(
             elevation: 10,

             color: Colors.deepOrange,
             child: InkWell(
               onTap: ()
               {
                 navigateTo(context, HomeLayOut());
               },
               child: const Text('ToDo App',
                 style: TextStyle(
                   fontSize: 30,
                   fontWeight: FontWeight.bold,

                 ),
               ),
             ),
           )  ,
           const SizedBox(
             height: 30,
           ),
           Card(

             elevation: 10,
             color: Colors.deepOrange,
             child: InkWell(
               onTap: ()
               {
                 navigateTo(context, const NewsLayout());
               },
               child: const Text('News App',
                 style: TextStyle(
                   fontSize: 30,
                   fontWeight: FontWeight.bold,

                 ),
               ),
             ),
           )  ,
           const SizedBox(
             height:30 ,
           ),
           Card(
             elevation: 10,

             color: Colors.deepOrange,
             child: InkWell(
               onTap: ()
               {
                 navigateTo(context, CounterScreen());
               },
               child: const Text('Counter App',
                 style: TextStyle(
                   fontSize: 30,
                   fontWeight: FontWeight.bold,

                 ),
               ),
             ),
           )  ,

         ],
        ),
      ),
    );
  }
}
