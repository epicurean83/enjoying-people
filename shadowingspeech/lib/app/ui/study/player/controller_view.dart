import 'package:ep_core/ui/bloc_provider.dart';
import 'package:flutter/material.dart';
import 'package:shadowingspeech/app/ui/study/player_bloc.dart';

class ControllerView extends StatelessWidget {
  const ControllerView({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<PlayerBloc>(context);
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 14.0),
        child: Row(
          children: [
            IconButton(
              onPressed: () => bloc?.execute(Command.setting),
              icon: const Icon(Icons.tune),
            ),
            const Expanded(child: SizedBox()),
            IconButton(
              onPressed: () => bloc?.execute(Command.previous),
              icon: const Icon(Icons.skip_previous),
            ),
            ElevatedButtonTheme(
              data: ElevatedButtonThemeData(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  foregroundColor: Theme.of(context).colorScheme.onPrimary,
                  minimumSize: const Size(70.0, 70.0),
                ),
              ),
              child: StreamBuilder<PlayStatus>(
                initialData: PlayStatus.stopped,
                stream: bloc?.statusStream,
                builder: (context, snapshot) {
                  if (snapshot.data == PlayStatus.playing) {
                    return ElevatedButton(
                        onPressed: () => bloc?.stop(),
                        child: const Icon(
                          Icons.stop,
                          size: 40.0,
                        ));
                  }
                  return ElevatedButton(
                      onPressed: () => bloc?.play(),
                      child: const Icon(
                        Icons.play_arrow,
                        size: 40.0,
                      ));
                },
              ),
            ),
            IconButton(
              onPressed: () => bloc?.execute(Command.next),
              icon: const Icon(Icons.skip_next),
            ),
            const Expanded(child: SizedBox()),
            const SizedBox(width: 50)
          ],
        ),
      ),
    );
  }
}
