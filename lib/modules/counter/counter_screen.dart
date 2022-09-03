import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cupit/cupit.dart';
import 'cupit/states.dart';

   class CounterScreen extends StatelessWidget
   {


   int counter = 1;

  CounterScreen({Key? key}) : super(key: key);
   @override

   @override
   Widget build(BuildContext context) {
     return BlocProvider(
       create: (BuildContext context) => CounterCupit(),
       child: BlocConsumer<CounterCupit,CounterStates>(
         listener: (BuildContext context,CounterStates state)
         {

           if (state is CounterPlusState)
           {
           if (kDebugMode) {
             print('PlusState ${state.counter}');
           }
           }
           if (state is CounterMinusState)
           {
             if (kDebugMode) {
               print('MinusState ${state.counter}');
             }
           }
         },
         builder: (BuildContext context,CounterStates state){
           return Scaffold(
             backgroundColor: Colors.white,
             appBar: AppBar(
               centerTitle: true,
               backgroundColor: Colors.purple,
               title: const Text('Counter',
                 style: TextStyle(
                     color: Colors.white,
                     fontSize: 30,
                     fontWeight: FontWeight.bold
                 ),
               ),
             ),
             body: Center(
               child: Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     TextButton(onPressed:
                         ()
                     {
                       CounterCupit.get(context).plus();
                     }
                         , child:const Text("PLUS",
                           style: TextStyle(
                             color: Colors.purple,
                             fontSize: 35,
                             fontWeight: FontWeight.bold,
                           ),
                         )),
                     const SizedBox(
                       width: 20,
                     ),
                     Text('${CounterCupit.get(context).counter}',
                       style: const TextStyle(
                         color: Colors.black,
                         fontSize: 35,
                         fontWeight: FontWeight.bold,
                       ),
                     ),
                     const SizedBox(
                       width: 20,
                     ),
                     TextButton(onPressed: ()
                     {
                       CounterCupit.get(context).minus();
                     }
                         , child:const Text("MINUS",
                           style: TextStyle(
                             color: Colors.purple,
                             fontSize: 35,
                             fontWeight: FontWeight.bold,
                           ),
                         )),

                   ]
               ),
             ),
           );
         },
       ),
     );
   }

  }



