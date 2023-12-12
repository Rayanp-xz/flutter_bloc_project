import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'counter_bloc.dart';

class CounterHome extends StatefulWidget {
  const CounterHome({super.key});

  @override
  State<CounterHome> createState() => _CounterHomeState();
}


class _CounterHomeState extends State<CounterHome> {
  @override
  void initState() {
    OutoIncrement(context);

    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 100),
          child: Container(
            width: 300,
            height: 300,
            child: Column(
              children: [
                BlocBuilder<CounterBloc, CounterState>(
                  builder: (context, state) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 100),
                      child: Text("${state.count}"),
                    );
                  },
                ),
                SizedBox(
                  height: 70,
                ),
                Center(
                  child: Row(
                    children: [
                      ElevatedButton(onPressed: () {
                        context.read<CounterBloc>().add(Increment());

                      }, child: Text("Add")),
                      SizedBox(
                        width: 50,
                      ),

                      ElevatedButton(onPressed: () {
                        context.read<CounterBloc>().add(Decrement());

                      }, child: Text("Minus"))
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void OutoIncrement(BuildContext context)async{
    await Future.delayed(Duration(seconds: 2));
    context.read<CounterBloc>().add(Increment());
    await Future.delayed(Duration(seconds: 2));
    context.read<CounterBloc>().add(Increment());
  }
}

