import 'package:flutter/material.dart';
import 'package:flutter_bloc_timer/timer/view/widgets/background.dart';
import 'package:flutter_bloc_timer/timer/view/widgets/timer_actions.dart';
import 'package:flutter_bloc_timer/timer/view/widgets/timer_text.dart';

class TimerView extends StatelessWidget {
  const TimerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Flutter Timer")),
      body: const Stack(
        children: [
          Background(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 100),
                child: Center(
                  child: TimerText(),
                ),
              ),
              TimerActions(),
            ],
          )
        ],
      ),
    );
  }
}