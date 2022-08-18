import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget {
   const CounterScreen({Key? key}) : super(key: key);


  @override
  State<CounterScreen> createState() => _CounterScreenState();

}

class _CounterScreenState extends State<CounterScreen>
{
  int counter = 1;
  @override
  void initState()
  {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              setState(()
              {
                counter++;
                if (kDebugMode) {
                  print(counter);
                }
              });
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
             Text('$counter',
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
              setState(()
              {
                counter--;
                if (kDebugMode) {
                  print(counter);
                }
              });
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
  }
}
