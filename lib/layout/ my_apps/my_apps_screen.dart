import 'package:course/layout/news_app/news_layout.dart';
import 'package:course/layout/todo_app/todo_layout.dart';
import 'package:course/modules/basics_app/counter/counter_screen.dart';
import 'package:course/modules/bmi_app/bmi/bmi_screen.dart';
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
        title:const Padding(
          padding: EdgeInsets.all(10),
          child: Text('My Apps',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          ),
        ),

      ),

      body: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Container(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
           mainAxisAlignment: MainAxisAlignment.center,
           children:   [
          Card(
            margin: const EdgeInsets.symmetric(horizontal: 20),

            elevation: 10,
            color: Colors.deepOrange,
            child: InkWell(

              onTap: ()
              {
                navigateTo(context, const BmiScreen());
              },
              child:const Padding(
                padding: EdgeInsets.all(10),
                child: Text('BMI App',
                style:  TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,

                ),
                ),
              ),
            ),
          )  ,
           const SizedBox(
            height: 30,
          ),
             Card(
               elevation: 10,
               margin: const EdgeInsets.symmetric(horizontal: 20),

               color: Colors.deepOrange,
               child: InkWell(
                 onTap: ()
                 {
                   navigateTo(context, HomeLayOut());
                 },
                 child: const Padding(
                   padding:  EdgeInsets.all(10),
                   child:  Text('ToDo App',
                     style: TextStyle(
                       fontSize: 30,
                       fontWeight: FontWeight.bold,
                       color: Colors.white,

                     ),
                   ),
                 ),
               ),
             )  ,
             const SizedBox(
               height: 30,
             ),
             Card(
               margin: const EdgeInsets.symmetric(horizontal: 20),

               elevation: 10,
               color: Colors.deepOrange,
               child: InkWell(
                 onTap: ()
                 {
                   navigateTo(context, const NewsLayout());
                 },
                 child: const Padding(
                   padding: EdgeInsets.all(10),
                   child: Text('News App',
                     style: TextStyle(
                       fontSize: 30,
                       fontWeight: FontWeight.bold,
                       color: Colors.white,
                     ),
                   ),
                 ),
               ),
             )  ,
             const SizedBox(
               height:30 ,
             ),
             Card(
               margin: const EdgeInsets.symmetric(horizontal: 20),

               elevation: 10,

               color: Colors.deepOrange,
               child: InkWell(
                 onTap: ()
                 {
                   navigateTo(context, CounterScreen());
                 },
                 child: const Padding(
                   padding: EdgeInsets.all(10),
                   child: Text('Counter App',
                     style: TextStyle(
                       fontSize: 30,
                       fontWeight: FontWeight.bold,
                        color: Colors.white,
                     ),
                   ),
                 ),
               ),
             )  ,

           ],
          ),
        ),
      ),
    );
  }
}
