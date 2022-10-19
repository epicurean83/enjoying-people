import 'dart:async';

import 'package:ep_core/ui/bloc_provider.dart';
import 'package:logging/logging.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shadowingspeech/domain/model/sentence.dart';
import 'package:shadowingspeech/domain/repository/sentence_repository.dart';

class PlayerBloc extends BlocBase {
  final logger = Logger("PlayerBloc");

  final SentenceRepository sentenceRepository;

  PlayerBloc({
    required this.sentenceRepository,
  });

  final _sentenceController = BehaviorSubject<List<Sentence>>();
  Stream<List<Sentence>> get sentenceStream => _sentenceController.stream;

  final _statusController = BehaviorSubject<PlayStatus>();
  Stream<PlayStatus> get statusStream => _statusController.stream;

  final _playCommandController = StreamController<Command>.broadcast();
  Stream<Command> get playCommandStream => _playCommandController.stream;

  Future<void> loadSentence() async {
    return _sentenceController.addStream(
      sentenceRepository.getTodaySentences().asStream(),
    );
  }

  void play() {
    if (_statusController.valueOrNull == PlayStatus.playing) {
      return;
    }
    _statusController.sink.add(PlayStatus.playing);
  }

  void stop() {
    if (_statusController.valueOrNull == PlayStatus.stopped) {
      return;
    }

    _statusController.sink.add(PlayStatus.stopped);
  }

  void execute(Command command) {
    _playCommandController.sink.add(command);
  }

  @override
  void dispose() async {
    await _sentenceController.drain();
    await _sentenceController.close();
  }
}

enum PlayStatus {
  playing,
  stopped,
}

enum Command {
  next,
  previous,
  setting,
}
