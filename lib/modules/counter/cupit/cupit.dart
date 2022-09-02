import 'package:course/modules/counter/cupit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCupit extends Cubit<CounterStates>
{
 CounterCupit() : super(CounterInitialState());
 static CounterCupit get(context) => BlocProvider.of(context);
 int counter = 1;
 void minus()
 {
  counter--;
  emit(CounterMinusState(counter));
 }
 void plus()
 {
  counter++;
  emit(CounterPlusState(counter));
 }
}