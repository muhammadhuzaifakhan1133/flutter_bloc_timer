import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_timer/timer/bloc/timer_bloc.dart';
import 'package:flutter_bloc_timer/timer/bloc/timer_event.dart';
import 'package:flutter_bloc_timer/timer/bloc/timer_state.dart';

class TimerActions extends StatelessWidget {
  const TimerActions({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TimerBloc, TimerState>(
      buildWhen: (previous, current) => previous != current,
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: actionButtons(state, context)
        );
      },
    );
  }

  List<FloatingActionButton> actionButtons(TimerState state, BuildContext context) {
    List<FloatingActionButton> buttons = [];
    if (state is TimerInitial) {
      buttons = [
        FloatingActionButton(
          child: const Icon(Icons.play_arrow),
          onPressed: () => context.read<TimerBloc>().add(TimerStarted(duration: state.duration)),
        ),
      ];
    } else if (state is TimerRunInProgress) {
      buttons = [
        FloatingActionButton(
          child: const Icon(Icons.pause),
          onPressed: () => context.read<TimerBloc>().add(const TimerPaused()),
        ),
        FloatingActionButton(
          child: const Icon(Icons.replay),
          onPressed: () => context.read<TimerBloc>().add(const TimerReset()),
        ),
      ];
    } else if (state is TimerRunPause) {
      buttons = [
        FloatingActionButton(
          child: const Icon(Icons.play_arrow),
          onPressed: () => context.read<TimerBloc>().add(const TimerResumed()),
        ),
        FloatingActionButton(
          child: const Icon(Icons.replay),
          onPressed: () => context.read<TimerBloc>().add(const TimerReset()),
        ),
      ];
    } else if (state is TimerRunComplete) {
      buttons = [
        FloatingActionButton(
          child: const Icon(Icons.replay),
          onPressed: () => context.read<TimerBloc>().add(const TimerReset()),
        ),
      ];
    }
    return buttons;
  }
}
